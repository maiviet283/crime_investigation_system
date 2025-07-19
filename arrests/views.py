from django.shortcuts import render, redirect
from django.contrib import messages

from accounts.decorators import login_required_session

from .models import Arrest
from accounts.models import User


@login_required_session
def chief_report(request):
    """
    View function for the Chief Officer's report page.

    - Ensures the user is authenticated via session.
    - Retrieves the current user's role and full name.
    - Gathers a dataset of arrest-related information from related models:
        - Case number, type, severity, creation date
        - Officer role
        - Suspect address
        - Case status
    - Passes the data to the template for rendering the report.
    """
    username = request.session.get('username')

    try:
        user_info = User.objects.select_related('role').filter(
            username=username
        ).values_list('role_id__description', 'fullname').first()
    except Exception:
        messages.error(request, "Error retrieving user information.")
        return redirect('accounts:login-two')

    if not user_info:
        messages.error(request, "User not found.")
        return redirect('accounts:login-two')

    role_description, fullname = user_info

    try:
        datasets = Arrest.objects.select_related(
            'suspect_id__case_id', 'officer_id__role_id', 'suspect_id'
        ).values(
            'suspect_id__case_id__case_number',
            'suspect_id__case_id__type_case',
            'suspect_id__case_id__severity',
            'suspect_id__case_id__create_at',
            'officer_id__role_id__description',
            'suspect_id__address',
            'suspect_id__case_id__status'
        )
    except Exception:
        messages.error(request, "Error retrieving arrest data.")
        datasets = []

    return render(request, 'arrests/chief_report.html', {
        'role_description': role_description,
        'fullname': fullname,
        'data': datasets,
    })
