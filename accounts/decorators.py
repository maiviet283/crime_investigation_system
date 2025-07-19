from django.shortcuts import redirect
from functools import wraps

def login_required_session(view_func):
    @wraps(view_func)
    def wrapper(request, *args, **kwargs):
        if not request.session.get('username'):
            return redirect('accounts:login-two')
        return view_func(request, *args, **kwargs)
    return wrapper
