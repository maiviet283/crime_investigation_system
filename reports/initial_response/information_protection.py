from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_POST
from django.contrib import messages

from accounts.decorators import login_required_session

from investigations.models import InvestigationPlan


@login_required_session
def create_information_protection(request):
    """
    Display and handle the creation of a new InvestigationPlan related to information protection.
    GET: Renders the creation form.
    POST: Processes submitted form and redirects to initial response view.
    """
    if request.method == 'POST':
        try:
            officer = request.POST.get('officer')
            start = request.POST.get('start')
            end = request.POST.get('end')
            plan_content = request.POST.get('plan_content')
            summary = request.POST.get('summary')
            result = request.POST.get('result')

            print(officer, start, end, plan_content, summary, result)

            return redirect('reports:initial-response')
        except Exception as e:
            messages.error(request, f"An error occurred: {e}")

    context = {
        'section': 'INFORMATION PROTECTION FIELD',
    }
    return render(request, 'reports/create_information_protection.html', context)


@login_required_session
def update_information_protection(request, id):
    """
    Update an existing InvestigationPlan by ID.
    GET: Load data into the form for editing.
    POST: Save updated plan_content and redirect to initial response view.
    """
    investigation_plan = get_object_or_404(InvestigationPlan, investigation_plan_id=id)

    if request.method == 'POST':
        try:
            investigation_plan.plan_content = request.POST.get("plan_content")
            investigation_plan.save()
            return redirect('reports:initial-response')
        except Exception as e:
            messages.error(request, f"Failed to update: {e}")

    context = {
        'section': 'INFORMATION PROTECTION FIELD',
        'investigation_plan': investigation_plan,
    }
    return render(request, 'reports/update_information_protection.html', context)


@login_required_session
@require_POST
def delete_information_protection(request, id):
    """
    Soft-delete an InvestigationPlan by setting is_deleted=True.
    Only accessible via POST request to prevent accidental deletion.
    """
    try:
        measure = get_object_or_404(InvestigationPlan, investigation_plan_id=id)
        measure.is_deleted = True
        measure.save()
        messages.success(request, "Investigation plan deleted successfully.")
    except Exception as e:
        messages.error(request, f"Failed to delete: {e}")
    return redirect('reports:initial-response')
