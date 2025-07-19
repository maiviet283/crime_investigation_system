import logging

from django.shortcuts import render
from django.contrib import messages
from django.http import HttpResponse


logger = logging.getLogger(__name__)

# Create your views here.
def home_view(request):
    """
    Render the index page.
    """
    try:
        return render(request, 'home/home.html')
    except Exception as e:
        logger.error(f"Error rendering home page: {e}")
        messages.error(request, 'An error occurred while loading the page.')
        # Fallback to a simple response
        return HttpResponse("Home page temporarily unavailable.", status=500)

def reporter_form_view(request):
    """
    Render the reporter form page.
    """
    try:
        return render(request, 'home/reporter_form.html')
    except Exception as e:
        logger.error(f"Error rendering reporter form: {e}")
        messages.error(request, 'An error occurred while loading the form.')
        from django.http import HttpResponse
        return HttpResponse("Form temporarily unavailable.", status=500)

def incident_form_view(request):
    """
    Render the incident form page.
    """
    try:
        return render(request, 'home/incident_form.html')
    except Exception as e:
        logger.error(f"Error rendering incident form: {e}")
        messages.error(request, 'An error occurred while loading the form.')
        from django.http import HttpResponse
        return HttpResponse("Form temporarily unavailable.", status=500)
def login_view(request):
    return render(request, 'login/login.html')