from django.shortcuts import render, redirect
from django.contrib.auth.hashers import check_password
from django.contrib import messages

from .models import User


def home(request):
    """
    Home page view after successful login.

    - Retrieves the current user's username from session.
    - Fetches user details (full name, email, phone, role) from the database.
    - Renders the user information in the home template.
    """
    username = request.session.get('username')
    user = None

    if username:
        try:
            user = User.objects.select_related('role_id').filter(
                username=username, is_deleted=False
            ).values(
                'username', 'fullname', 'email', 'phonenumber', 'role_id__description', 'role_id__role_id'
            ).first()
        except Exception:
            messages.error(request, "Error loading user information.")
            user = None

    return render(request, 'accounts/home.html', {'user': user})


def login(request):
    """
    Login view for user authentication.

    - If the user is already logged in, redirects to the home page.
    - On POST request: validates the credentials and sets the session.
    - On failure: shows an error message.
    - On GET request: renders the login form.
    """
    if request.session.get('username'):
        return redirect('accounts:home')

    context = {}

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        try:
            user = User.objects.filter(username=username, is_deleted=False).first()
        except Exception:
            messages.error(request, "An error occurred while accessing user data.")
            return render(request, 'accounts/login.html', {})

        if user and check_password(password, user.password_hash):
            request.session['username'] = user.username
            return redirect('accounts:home')
        else:
            context['error'] = 'Invalid username or password'

    return render(request, 'accounts/login.html', context)


def logout(request):
    """
    Logout view to end the user session.

    - Removes the username from session.
    - Redirects to the login page.
    """
    try:
        request.session.pop('username', None)
    except Exception:
        pass  # Silently ignore logout exceptions

    return redirect('accounts:login-two')


def logout_and_home(request):
    """
    Logout and redirect to report home page.
    """
    try:
        request.session.pop('username', None)
    except Exception:
        pass
    from django.urls import reverse
    from django.http import HttpResponseRedirect
    return HttpResponseRedirect(reverse('home:home'))
