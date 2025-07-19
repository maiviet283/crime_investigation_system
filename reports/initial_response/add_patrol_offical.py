from django.shortcuts import redirect
from django.contrib import messages
from django.views.decorators.http import require_POST
from django.urls import reverse
from urllib.parse import urlencode

from accounts.decorators import login_required_session
from cases.models import Case


@require_POST
@login_required_session
def assign_patrol_officer(request):
    """
    View function to assign patrol officers to cases by updating the case status.

    - Requires POST request and user session authentication.
    - Reads selected case IDs from the submitted form (checkboxes).
    - Only updates cases currently in 'CLOSED' status.
    - Updates status to 'OPEN' (i.e., 'On Above Case').
    - Displays success or error messages based on the result.

    Redirects back to the patrol officer listing page, preserving any filter/search/page parameters.
    """
    try:
        selected_case_ids = request.POST.getlist('selected_cases')

        if not selected_case_ids:
            messages.warning(request, "No case was selected.")
        else:
            try:
                selected_case_ids = list(map(int, selected_case_ids))
            except ValueError:
                messages.error(request, "Invalid case ID(s) provided.")
                return _redirect_with_query_params(request)

            updated_count = Case.objects.filter(
                case_id__in=selected_case_ids,
                status='CLOSED'
            ).update(status='OPEN')

            if updated_count > 0:
                messages.success(request, f"{updated_count} case(s) successfully updated to 'On Above Case'.")
            else:
                messages.info(request, "No cases were updated. They might already be open or invalid.")

    except Exception as e:
        messages.error(request, f"An unexpected error occurred: {str(e)}")

    return _redirect_with_query_params(request)


def _redirect_with_query_params(request):
    """Helper to preserve query parameters in redirect."""
    redirect_params = {
        'q': request.POST.get('q', '').strip(),
        'status': request.POST.get('status', '').strip(),
        'zone': request.POST.get('zone', '').strip(),
        'page': request.POST.get('page', '').strip(),
    }
    query_string = urlencode({k: v for k, v in redirect_params.items() if v})
    redirect_url = f"{reverse('reports:police-patrol-list')}?{query_string}" if query_string else reverse('reports:police-patrol-list')
    return redirect(redirect_url)
