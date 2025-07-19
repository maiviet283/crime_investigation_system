from django.shortcuts import render, redirect
from django.contrib.auth.hashers import check_password
from django.contrib import messages
from django.core.cache import cache

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
    Handle user login.

    - If the user is already authenticated, redirect to the home page.
    - On POST: validate credentials, track failed attempts, and login the user.
    - On GET or failed login: render the login page with errors (if any).
    """

    if request.session.get('username'):
        return redirect('accounts:home')

    context = {}

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        ip = get_client_ip(request)
        cache_key = f"bf:{ip}"
        attempts = cache.get(cache_key, 0)

        try:
            user = User.objects.filter(username=username, is_deleted=False).first()
        except Exception as e:
            print(f"Database error: {e}")
            messages.error(request, "An error occurred while accessing user data.")
            return render(request, 'accounts/login.html', context)

        if user and check_password(password, user.password_hash):
            request.session['username'] = user.username
            cache.delete(cache_key)
            return redirect('accounts:home')
        else:
            cache.set(cache_key, attempts + 1, timeout=300)
            context['error'] = 'Invalid username or password.'

    return render(request, 'accounts/login.html', context)


def get_client_ip(request):
    """
    Extract the client's IP address from the request headers.

    Returns:
        str: IP address as string.
    """
    try:
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(',')[0].strip()
        else:
            ip = request.META.get('REMOTE_ADDR')
        return ip
    except Exception as e:
        print(f"IP detection error: {e}")
        return '0.0.0.0'


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
