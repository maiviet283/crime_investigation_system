"""
reports/views.py

This module contains views for handling crime report submission, management, and related AJAX endpoints.
"""

import uuid
import logging

from django.contrib import messages
from django.core.files.storage import default_storage
from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import redirect, render
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from formtools.wizard.views import SessionWizardView

from evidence.models import Evidence
from investigations.models import Victim, Witness
from reports.models import Suspect
from .forms import ReporterForm, IncidentForm
from .models import Report, ReportSuspect, ReportVictim, ReportWitness
from .upload_file_views import handle_uploaded_files
from accounts.models import User

class ReportWizardView(SessionWizardView):
    """
    Wizard view for handling crime report submission process.
    Provides a multi-step form for collecting reporter information
    and incident details with support for related parties and evidence.
    """
    form_list = [ReporterForm, IncidentForm]
    file_storage = 'django.core.files.storage.FileSystemStorage'
    template_name = 'reports/report_wizard.html'

    def get_form_initial(self, step):
        """
        Get initial form data for the specified step.
        Args:
            step (str): The current step identifier
        Returns:
            dict: Initial form data with pre-filled values if available
        """
        initial = super().get_form_initial(step)
        # Prefill reporter info if available in session
        if step == '0' and 'report_id' in self.request.session:
            report = Report.objects.filter(report_id=self.request.session['report_id']).first()
            if report:
                initial.update({
                    'reporter_fullname': report.reporter_fullname,
                    'reporter_email': report.reporter_email,
                    'reporter_phonenumber': report.reporter_phonenumber,
                })
        # Prefill incident info if available in session
        elif step == '1' and 'incident_data' in self.request.session:
            incident_data = self.request.session['incident_data']
            initial.update({
                'type_report': incident_data.get('type_report', ''),
                'severity': incident_data.get('severity', ''),
                'description': incident_data.get('description', ''),
                'case_location': incident_data.get('case_location', ''),
            })
            # Handle datetime field
            if incident_data.get('reported_at'):
                try:
                    from datetime import datetime
                    reported_at = datetime.fromisoformat(incident_data['reported_at'])
                    initial['reported_at'] = reported_at
                except (ValueError, TypeError):
                    initial['reported_at'] = timezone.now()
        return initial

    def get_context_data(self, form, **kwargs):
        """
        Get context data for the template rendering.
        Args:
            form: The current form instance
            **kwargs: Additional context data
        Returns:
            dict: Context data including step information and related data
        """
        context = super().get_context_data(form=form, **kwargs)
        context['step_title'] = ['Reporter Information', 'Incident Information'][int(self.steps.current)]
        context['step_number'] = int(self.steps.current) + 1
        # Only load parties and evidence at step 2
        if self.steps.current == '1' or int(self.steps.current) == 1:
            report_id = self.request.session.get('report_id')
            if report_id:
                context['related_parties'] = self._get_related_parties(report_id)
                context['evidences'] = self._get_evidences(report_id)
            else:
                context['related_parties'] = []
                context['evidences'] = []
        else:
            context['related_parties'] = []
            context['evidences'] = []
        return context

    def _get_related_parties(self, report_id):
        """
        Get related parties (suspects, victims, witnesses) for a report.
        Args:
            report_id: The report ID to get parties for
        Returns:
            list: List of related party dictionaries
        """
        related_parties = []
        try:
            # Optimize queries with select_related and prefetch_related
            report = Report.objects.select_related('case_id').get(report_id=report_id)
            # Get suspects
            suspects = ReportSuspect.objects.select_related('suspect_id').filter(report_id=report)
            for rs in suspects:
                related_parties.append({
                    'role': 'Suspect',
                    'name': rs.suspect_id.fullname,
                    'statement': rs.suspect_id.description,
                    'attachment': rs.suspect_id.mugshot_url,
                    'id': rs.suspect_id.suspect_id,
                })
                if rs.suspect_id.mugshot_url:
                    file_path = default_storage.save(f'file/party/{rs.suspect_id.mugshot_url.name}', rs.suspect_id.mugshot_url)
                    rs.suspect_id.mugshot_url = file_path
                    rs.suspect_id.save()
        
            # Get victims
            victims = ReportVictim.objects.select_related('victim_id').filter(report_id=report)
            for rv in victims:
                related_parties.append({
                    'role': 'Victim',
                    'name': rv.victim_id.fullname,
                    'statement': rv.victim_id.injurie,
                    'attachment': None,
                    'id': rv.victim_id.victim_id,
                })
            # Get witnesses
            witnesses = ReportWitness.objects.select_related('witness_id').filter(report_id=report)
            for rw in witnesses:
                related_parties.append({
                    'role': 'Witness',
                    'name': rw.witness_id.fullname,
                    'statement': rw.witness_id.statement,
                    'attachment': None,
                    'id': rw.witness_id.witness_id,
                })
        except Report.DoesNotExist:
            logger = logging.getLogger(__name__)
            logger.warning(f"Report with ID {report_id} not found in session")
        except Exception as e:
            logger = logging.getLogger(__name__)
            logger.error(f"Error retrieving related parties for report {report_id}: {e}")
        return related_parties

    def _get_evidences(self, report_id):
        """
        Get evidence for a report.
        Args:
            report_id: The report ID to get evidence for
        Returns:
            list: List of evidence dictionaries
        """
        evidences = []
        try:
            report = Report.objects.get(report_id=report_id)
            evidence_list = Evidence.objects.filter(report_id=report)
            for evidence in evidence_list:
                evidences.append({
                    'type': evidence.evidence_type,  # Use evidence_type instead of description
                    'location': evidence.location_at_scene,
                    'description': evidence.description,
                    'attachment': evidence.attached_file,
                    'id': evidence.evidence_id,
                })
                if evidence.attached_file:
                    file_path = default_storage.save(f'evidence/{evidence.attached_file.name}', evidence.attached_file)
                    evidence.attached_file = file_path
                    evidence.save()
        except Report.DoesNotExist:
            logger = logging.getLogger(__name__)
            logger.warning(f"Report with ID {report_id} not found when getting evidence")
        except Exception as e:
            logger = logging.getLogger(__name__)
            logger.error(f"Error retrieving evidence for report {report_id}: {e}")
        return evidences

    def process_step(self, form, **kwargs):
        """
        Process the current step of the wizard.
        Args:
            form: The form instance for the current step
            **kwargs: Additional keyword arguments
        Returns:
            The result of the parent class process_step method
        """
        cleaned_data = form.cleaned_data
        if self.steps.current == '0':
            # Step 1: Check if report exists in session
            if 'report_id' not in self.request.session:
                # Create new report if it doesn't exist
                report = Report.objects.create(
                    case_id=None,  # Not linked to a case yet
                    type_report='',
                    description='',
                    case_location='',
                    reported_at=timezone.now(),
                    reporter_fullname=cleaned_data['reporter_fullname'],
                    reporter_email=cleaned_data['reporter_email'],
                    reporter_phonenumber=cleaned_data['reporter_phonenumber'],
                    status='PENDING',
                )
                # Save report_id to session for step 2
                self.request.session['report_id'] = report.report_id
            else:
                # If report exists, update reporter info
                report_id = self.request.session['report_id']
                try:
                    report = Report.objects.get(report_id=report_id)
                    report.reporter_fullname = cleaned_data['reporter_fullname']
                    report.reporter_email = cleaned_data['reporter_email']
                    report.reporter_phonenumber = cleaned_data['reporter_phonenumber']
                    report.save()
                    print(f"Updated existing report {report_id} with new reporter data")
                except Report.DoesNotExist:
                    # Create new report if the old one doesn't exist
                    report = Report.objects.create(
                        case_id=None,
                        type_report='',
                        description='',
                        case_location='',
                        reported_at=timezone.now(),
                        reporter_fullname=cleaned_data['reporter_fullname'],
                        reporter_email=cleaned_data['reporter_email'],
                        reporter_phonenumber=cleaned_data['reporter_phonenumber'],
                        status='PENDING',
                    )
                    self.request.session['report_id'] = report.report_id
            
        elif self.steps.current == '1':
            # Step 2: Temporarily store incident data in session
            self.request.session['incident_data'] = {
                'type_report': cleaned_data.get('type_report', ''),
                'severity': cleaned_data.get('severity', ''),
                'reported_at': cleaned_data.get('reported_at', timezone.now()).isoformat(),
                'description': cleaned_data.get('description', ''),
                'case_location': cleaned_data.get('case_location', ''),
            }
        return super().process_step(form, **kwargs)

    def done(self, form_list, **kwargs):
        """
        Handle the completion of the wizard.
        Update incident info in the existing report and complete the process.
        """
        incident_data = form_list[1].cleaned_data
        
        try:
            # Get report_id from session
            report_id = self.request.session.get('report_id')
            if not report_id:
                messages.error(self.request, 'Report session not found. Please start over.')
                return redirect('reports:report_wizard')
            
            # Get the existing report
            report = Report.objects.get(report_id=report_id)
            
            # Update incident info in the report
            report.type_report = incident_data.get('type_report', '')
            report.description = incident_data.get('description', '')
            report.case_location = incident_data.get('case_location', '')
            report.reported_at = incident_data.get('reported_at', timezone.now())
            report.status = 'PENDING'  # Change from DRAFT to PENDING
            report.save()
            
            # Clear temporary session data
            self.request.session.pop('report_id', None)
            self.request.session.pop('incident_data', None)
            
            messages.success(self.request, 'Report submitted successfully!')
            context = {
                'step_number': 3,
                'step_title': 'Confirmation',
                # Add other variables if needed
            }
            return render(self.request, 'reports/report_wizard.html', context)

            
        except Report.DoesNotExist:
            messages.error(self.request, 'Report not found. Please start over.')
            return redirect('reports:report_wizard')
        except Exception as e:
            messages.error(self.request, f'Error submitting report: {e}')
            return redirect('reports:report_wizard')

        


@csrf_exempt
def add_party(request):
    """
    Add a related party (suspect, victim, or witness) to the current report.
    Save with report_id from session, create party and link immediately.
    """
    
    if request.method == 'POST':
        try:
            # Validate input data
            fullname = request.POST.get('fullname', '').strip()
            relationship = request.POST.get('relationship')
            
            if not fullname:
                return JsonResponse({'success': False, 'error': 'Full name is required.'})
            if not relationship:
                return JsonResponse({'success': False, 'error': 'Relationship is required.'})
            
            # Get report_id from session
            report_id = request.session.get('report_id')
            if not report_id:
                return JsonResponse({'success': False, 'error': 'No report session found. Please complete the Reporter step.'})
            
            try:
                report = Report.objects.get(report_id=report_id)
            except Report.DoesNotExist:
                return JsonResponse({'success': False, 'error': 'Invalid report session. Please restart the process.'})
            
            # Create party based on relationship type
            party_id = None
            if relationship == 'suspect':
                suspect = Suspect.objects.create(
                    case_id=None,
                    report_id=report,  # Link immediately to report
                    suspect_role='Suspect',
                    fullname=fullname,
                    national=request.POST.get('nationality', 'Unknown'),
                    gender=request.POST.get('gender', 'Unknown'),
                    dob=None,
                    identification=str(uuid.uuid4())[:12],
                    phonenumber=None,
                    description=request.POST.get('statement', ''),
                    address='Unknown',
                    catch_time=None,
                    notes='',
                    status='',
                    health_status='Unknown'
                )
                if request.FILES.getlist('attachments'):
                    file_paths = handle_uploaded_files(request.FILES.getlist('attachments'), 'party')
                    if file_paths:
                        suspect.mugshot_url = file_paths[0]
                        suspect.save()  
                party_id = suspect.suspect_id
                
                # Create ReportSuspect link
                ReportSuspect.objects.create(report_id=report, suspect_id=suspect)
                
            elif relationship == 'victim':
                victim = Victim.objects.create(
                    case_id=None,
                    report_id=report,  # Link immediately to report
                    fullname=fullname,
                    contact='Unknown',
                    injurie=request.POST.get('statement', '') or 'None',
                    status=''
                )
                party_id = victim.victim_id
                
                # Create ReportVictim link
                ReportVictim.objects.create(report_id=report, victim_id=victim)
                
            elif relationship == 'witness':
                witness = Witness.objects.create(
                    case_id=None,
                    report_id=report,  # Link immediately to report
                    fullname=fullname,
                    contact='Unknown',
                    statement=request.POST.get('statement', '')
                )
                party_id = witness.witness_id
                
                # Create ReportWitness link
                ReportWitness.objects.create(report_id=report, witness_id=witness)
                
            else:
                return JsonResponse({'success': False, 'error': 'Invalid relationship type'})
            
            return JsonResponse({'success': True, 'party_id': party_id})
            
        except Exception as e:
            import traceback
            traceback.print_exc()
            return JsonResponse({'success': False, 'error': str(e)})
    
    return JsonResponse({'success': False, 'error': 'Method not allowed'})


@csrf_exempt
def add_evidence(request):
    """
    Add evidence to the current report.
    Save with report_id from session, create evidence and link immediately.
    """
    
    if request.method == 'POST':
        try:
            # Validate input data
            evidence_type = request.POST.get('evidence_type')
            location = request.POST.get('location')
            
            if not evidence_type:
                return JsonResponse({'success': False, 'error': 'Evidence type is required.'})
            if not location:
                return JsonResponse({'success': False, 'error': 'Location is required.'})
            
            # Get report_id from session
            report_id = request.session.get('report_id')
            if not report_id:
                return JsonResponse({'success': False, 'error': 'No report session found. Please complete the Reporter step.'})
            
            try:
                report = Report.objects.get(report_id=report_id)
            except Report.DoesNotExist:
                return JsonResponse({'success': False, 'error': 'Invalid report session. Please restart the process.'})
            
            # Create evidence
            evidence = Evidence.objects.create(
                case_id=None,
                report_id=report,  # Link immediately to report
                evidence_type=evidence_type,
                location_at_scene=location,
                description=request.POST.get('description', ''),
                date_collected=timezone.now().date(),
                status='COLLECTED',
            )
            
            # Handle attachments: Lưu vào media/file/evidence
            for attachment in request.FILES.getlist('attachments'):
                file_path = default_storage.save(f'file/evidence/{attachment.name}', attachment)
                evidence.attached_file = file_path
                evidence.save()
            
            return JsonResponse({'success': True, 'evidence_id': evidence.evidence_id})
            
        except Exception as e:
            import traceback
            traceback.print_exc()
            return JsonResponse({'success': False, 'error': str(e)})
    
    return JsonResponse({'success': False, 'error': 'Method not allowed'})


def start_report_wizard(request):
    """
    Start a new report wizard session.
    
    Clears any existing report session and redirects to the wizard.
    
    Args:
        request: HTTP request object
        
    Returns:
        HttpResponse: Redirect to the report wizard
    """
    # Clear all session data related to report
    if 'report_id' in request.session:
        del request.session['report_id']
    if 'incident_data' in request.session:
        del request.session['incident_data']
    return redirect('reports:report_wizard')


def report_management(request):
    # Get user info from session (reuse logic from accounts.views_two.home)
    username = request.session.get('username')
    user = None
    if username:
        try:
            user = User.objects.select_related('role_id').filter(
                username=username, is_deleted=False
            ).values(
                'username', 'fullname', 'email', 'phonenumber', 'role_id__description', 'avatar_url', 'role_id__role_id'
            ).first()
        except Exception:
            user = None

    # Kiểm tra quyền truy cập
    if not user or user.get('role_id__role_id') != 11:
        messages.error(request, 'You do not have permission to access this page.')
        return redirect('accounts:home')


    reports_list = Report.objects.all().order_by('report_id')

    # Filter by status
    status = request.GET.get('status')
    if status:
        reports_list = reports_list.filter(status__iexact=status)

    # Filter by type_report
    type_report = request.GET.get('type_report')
    if type_report:
        reports_list = reports_list.filter(type_report__iexact=type_report)

    # Filter by severity
    severity = request.GET.get('severity')
    if severity:
        reports_list = reports_list.filter(severity__iexact=severity)

    # Filter by creation date
    created_at = request.GET.get('created_at')
    if created_at:
        reports_list = reports_list.filter(reported_at__date=created_at)

    paginator = Paginator(reports_list, 10)
    page_number = request.GET.get('page')
    reports = paginator.get_page(page_number)

    # Get list of type_report for rendering in select
    type_report_list = Report.objects.values_list('type_report', flat=True).distinct()

    return render(request, 'reports/report_management.html', {
        'reports': reports,
        'type_report_list': type_report_list,
        'current_status': status,
        'current_type_report': type_report,
        'current_severity': severity,
        'current_created_at': created_at,
        'user': user,
    }) 




def delete_party(request, party_id):
    if request.method == 'POST':
        deleted = False

        # Thử xóa trong bảng chính
        try:
            party = Suspect.objects.get(suspect_id=party_id)
            party.delete()
            deleted = True
        except Suspect.DoesNotExist:
            pass

        if not deleted:
            try:
                party = Victim.objects.get(victim_id=party_id)
                party.delete()
                deleted = True
            except Victim.DoesNotExist:
                pass

        if not deleted:
            try:
                party = Witness.objects.get(witness_id=party_id)
                party.delete()
                deleted = True
            except Witness.DoesNotExist:
                pass

        if deleted:
            return JsonResponse({'success': True})
        else:
            return JsonResponse({'success': False, 'error': 'Party not found'})

    return JsonResponse({'success': False, 'error': 'Method not allowed'})



def delete_evidence(request, evidence_id):
    """
    Delete an evidence from the current report.
    """
    if request.method == 'POST':
        try:
            evidence = Evidence.objects.get(evidence_id=evidence_id)
            evidence.delete()
            return JsonResponse({'success': True})
        except Exception as e:
            return JsonResponse({'success': False, 'error': str(e)})
    return JsonResponse({'success': False, 'error': 'Method not allowed'})




