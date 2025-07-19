from django.shortcuts import render
from django.contrib import messages
from django.http import HttpResponseServerError

from accounts.decorators import login_required_session

from .models import Report, ReportVictim
from evidence.models import RecordInfo
from investigations.models import InvestigationPlan
from warrants.models import MeasureSurvey


@login_required_session
def initial_response(request):
    """
    View function for rendering the 'Initial Response' report page.
    - Retrieves the 3 most recent patrol officer reports (not deleted).
    - Extracts usernames of those officers.
    - Retrieves up to 3 latest preservation measures (investigation plans) 
      created by those officers and not marked as deleted.
    - Passes all data to the 'initial_response.html' template for rendering.
    """

    try:
        police_patrols = Report.objects.filter(
            officer_approve_username__role_id__description='Patrol Officer',
            is_deleted=False
        ).order_by('-officer_approve_username__create_at').values(
            'officer_approve_username__username',
            'officer_approve_username__fullname',
            'officer_approve_username__role_id__description',
            'officer_approve_username__phonenumber'
        )[:3]

        if not police_patrols:
            messages.warning(request, "No recent patrol officer reports found.")
            list_username = []
        else:
            list_username = [item["officer_approve_username__username"] for item in police_patrols]

        preservation_measures = []
        if list_username:
            preservation_measures = InvestigationPlan.objects.filter(
                accepted_officer_username__username__in=list_username,
                is_deleted=False
            ).order_by('-create_at').values(
                'investigation_plan_id', 'plan_content'
            )[:3]
        
        if not preservation_measures:
            messages.info(request, "No recent preservation measures found from these officers.")

        context = {
            'section': 'INITIAL RESPONSE',
            'police_patrols': police_patrols,
            'preservation_measures': preservation_measures
        }

        return render(request, 'reports/initial_response.html', context)

    except Exception:
        return HttpResponseServerError("An unexpected server error occurred. Please try again later.")


@login_required_session
def scene_information(request):
    """
    View function for displaying scene information.

    - Requires user to be authenticated via session.
    - Retrieves the 3 most recent initial reports from victims.
    - Retrieves 3 entries of preliminary physical evidence information.
    - Renders both sets of data in the scene information template.
    """

    try:
        data_scene_information = ReportVictim.objects.values(
            'report_id__report_id',
            'report_id__reported_at',
            'report_id__reporter_fullname',
            'report_id__description',
            'report_id__case_id__type_case',
            'report_id__type_report'
        ).order_by('report_id__reported_at')[:3]

        premilinary_physical_evidence_information = RecordInfo.objects.values(
            'record_info_id',
            'type_name',
            'summary',
            'evidence_id__date_collected'
        )[:3]

    except Exception:
        messages.error(request, "An error occurred while retrieving scene information.")
        data_scene_information = []
        premilinary_physical_evidence_information = []

    context = {
        'section': 'SCENE INFORMATION',
        'initial_statements': data_scene_information,
        'preliminary_evidence': premilinary_physical_evidence_information
    }

    return render(request, 'reports/scene_information.html', context)


@login_required_session
def investigation_report(request):
    """
    View to render the Initial Investigation Report page.
    
    This function retrieves the latest investigation case with related report data,
    including the assigned officers, collected evidence, and preliminary conclusions.

    Steps:
    1. Find the latest case_id that has an associated report.
    2. Retrieve all reports for that case, extracting officer info and report summary.
    3. Fetch all evidence linked to the case.
    4. Get the preliminary conclusion (investigation result) for the case.
    5. Pass all data to the template for rendering.
    """
    try:
        latest_case_id = (
            Report.objects
            .filter(officer_approve_username__isnull=False, case_id__isnull=False)
            .order_by('-reported_at')
            .values_list('case_id__case_id', flat=True)
            .first()
        )

        if not latest_case_id:
            raise Exception("No report data found.")

        reports = Report.objects.filter(case_id__case_id=latest_case_id).select_related(
            'officer_approve_username__role_id', 'case_id'
        ).values(
            'report_id',
            'case_id__case_id',
            'case_id__type_case',
            'case_id__summary',
            'reporter_fullname',
            'officer_approve_username__fullname',
            'officer_approve_username__phonenumber',
            'officer_approve_username__role_id__description',
        )

        data = {
            'case_id': latest_case_id,
            'officers': [],
            'case_summary': '',
            'type_case': '',
            'reporter_fullname': '',
        }

        for r in reports:
            data['officers'].append({
                'fullname': r['officer_approve_username__fullname'],
                'phone': r['officer_approve_username__phonenumber'],
                'role': r['officer_approve_username__role_id__description']
            })
            data['case_summary'] = r['case_id__summary']
            data['type_case'] = r['case_id__type_case']
            data['reporter_fullname'] = r['officer_approve_username__fullname']

        evidence_list = list(
            MeasureSurvey.objects.filter(
                is_deleted=False,
            ).values('type_name', 'result').distinct()
        )[:4]

        plan_result = (
            InvestigationPlan.objects.filter(
                case_id=latest_case_id,
                is_deleted=False
            ).values_list('plan_content', flat=True).first()
        )

        context = {
            'section': 'Initial Investigation Report',
            'data': data,
            'evidence_list': evidence_list,
            'plan_result': plan_result,
        }

    except Exception as e:
        messages.error(request, "An error occurred while generating the investigation report.")
        context = {
            'section': 'Initial Investigation Report',
            'data': None,
            'evidence_list': [],
            'plan_result': None,
        }

    return render(request, 'reports/investigation_report.html', context)
