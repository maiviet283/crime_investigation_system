import logging
from django.core.cache import cache
from django.http import HttpResponseForbidden

logger = logging.getLogger(__name__)

class BruteForceProtectionMiddleware:
    """
    Middleware to protect against brute-force login attacks.
    If an IP exceeds allowed login attempts, all requests from that IP are blocked.
    """

    def __init__(self, get_response):
        self.get_response = get_response
        self.max_attempts = 5
        self.lockout_time = 300 

    def __call__(self, request):
        try:
            ip = self.get_client_ip(request)
            cache_key = f"bf:{ip}"
            attempts = cache.get(cache_key, 0)

            # Block ALL requests from IP if locked out
            if attempts >= self.max_attempts:
                logger.warning(f"[Brute Force Blocked] IP {ip} exceeded max attempts.")
                return HttpResponseForbidden("You are temporarily blocked due to multiple failed login attempts.")

        except Exception as e:
            logger.error(f"[BruteForceMiddleware Error] {str(e)}")

        return self.get_response(request)

    def process_view(self, request, view_func, view_args, view_kwargs):
        # (optional) further logic can go here
        pass

    def get_client_ip(self, request):
        """
        Get IP address from request, supporting proxies.
        """
        try:
            x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
            if x_forwarded_for:
                ip = x_forwarded_for.split(',')[0].strip()
            else:
                ip = request.META.get('REMOTE_ADDR')
            return ip
        except Exception as e:
            logger.error(f"IP detection failed: {str(e)}")
            return 'unknown'
