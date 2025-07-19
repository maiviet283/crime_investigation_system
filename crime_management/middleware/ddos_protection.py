import logging
from django.core.cache import cache
from django.http import HttpResponse

logger = logging.getLogger(__name__)


class DDOSProtectionMiddleware:
    """
    Middleware to protect against simple DDoS or excessive request flooding.

    Limits the number of requests from a single IP address within a time window.
    Blocks IPs temporarily when the limit is exceeded.
    """

    def __init__(self, get_response):
        self.get_response = get_response
        self.request_limit = 20
        self.time_window = 20

    def __call__(self, request):
        try:
            ip = self.get_client_ip(request)
            cache_key = f"ddos:{ip}"

            request_count = cache.get(cache_key, 0) + 1
            cache.set(cache_key, request_count, timeout=self.time_window)

            if request_count > self.request_limit:
                logger.warning(f"[DDoS Blocked] IP {ip} exceeded request limit ({request_count} reqs in {self.time_window}s)")
                return HttpResponse("Too many requests. Please slow down.", status=429)
        except Exception as e:
            logger.error(f"DDOSProtectionMiddleware error: {str(e)}")

        return self.get_response(request)

    def get_client_ip(self, request):
        """
        Retrieve the real client IP address from headers.
        Supports proxies/load balancers (via HTTP_X_FORWARDED_FOR).
        """
        try:
            x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
            if x_forwarded_for:
                ip = x_forwarded_for.split(',')[0].strip()
            else:
                ip = request.META.get('REMOTE_ADDR')
            return ip
        except Exception as e:
            logger.error(f"Failed to extract IP: {str(e)}")
            return 'unknown'
