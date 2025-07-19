from django.core.paginator import Paginator
from django.shortcuts import render
from django.contrib import messages

from accounts.decorators import login_required_session

from ..models import Report


@login_required_session
def police_patrol_list(request):
    """
    View function for listing patrol officers assigned to scenes.

    - Requires user authentication (via session).
    - Supports filtering by case status, location zone, and officer's full name.
    - Retrieves unique status and zone options for filters.
    - Returns paginated results to template for display.
    """

    selected_status = request.GET.get('status', '')
    selected_zone = request.GET.get('zone', '')
    search_query = request.GET.get('q', '').strip()

    try:
        data = Report.objects.filter(
            officer_approve_username__role_id__description='Patrol Officer',
            is_deleted=False
        )
        if selected_status:
            data = data.filter(case_id__status=selected_status)
        if selected_zone:
            data = data.filter(case_location=selected_zone)
        if search_query:
            data = data.filter(officer_approve_username__fullname__icontains=search_query)

        data = data.order_by('-reported_at')
        data = data.values(
            'officer_approve_username__fullname',
            'case_id__status',
            'case_id__case_id',
            'officer_approve_username__role_id__description',
            'officer_approve_username__phonenumber',
            'case_location'
        )

        base_queryset = Report.objects.filter(
            officer_approve_username__role_id__description='Patrol Officer'
        )
        status_list = base_queryset.values_list('case_id__status', flat=True).distinct()
        zone_list = base_queryset.values_list('case_location', flat=True).distinct()

        page_number = request.GET.get('page', 1)
        paginator = Paginator(data, 10)
        page_obj = paginator.get_page(page_number)

    except Exception:
        messages.error(request, "An error occurred while retrieving patrol officer data.")
        return render(request, 'reports/police_patrol_list.html', {
            'section': 'ADD PATROL OFFICAL TO SCENE',
            'datasets': [],
            'status_list': [],
            'zone_list': [],
            'selected_status': selected_status,
            'selected_zone': selected_zone,
            'search_query': search_query,
        })

    context = {
        'section': 'ADD PATROL OFFICAL TO SCENE',
        'datasets': page_obj,
        'status_list': status_list,
        'zone_list': zone_list,
        'selected_status': selected_status,
        'selected_zone': selected_zone,
        'search_query': search_query,
    }

    return render(request, 'reports/police_patrol_list.html', context)