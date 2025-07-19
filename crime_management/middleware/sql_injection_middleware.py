import re
import logging
from django.http import HttpResponseForbidden

logger = logging.getLogger(__name__)

class SQLInjectionMiddleware:
    """
    Middleware to detect and block suspicious requests that may contain SQL Injection patterns.
    This checks GET, POST, and raw body data for common SQL injection keywords or expressions.
    """

    def __init__(self, get_response):
        self.get_response = get_response

        # Define regex patterns to detect potential SQL injection
        self.suspicious_patterns = [
            # Pattern for typical SQL injection logic like: ' OR '1'='1'
            r"(?i)(\bor\b|\band\b)\s+['\"]?\w+['\"]?\s*=\s*['\"]?\w+['\"]?",

            # Common SQL keywords used in injection attacks
            r"(?i)(\bunion\b|\bselect\b|\bdrop\b|\binsert\b|\bdelete\b|\bupdate\b)",

            # SQL comment syntax which is often used to ignore the rest of a legitimate query
            r"(--|\#|/\*|\*/)"
        ]

    def __call__(self, request):
        try:
            data = ""

            # Extract data from GET or POST or raw body depending on request method
            if request.method == "GET":
                data = " ".join(request.GET.values())
            elif request.method == "POST":
                data = " ".join(request.POST.values())
            else:
                # For other methods like PUT, PATCH, etc., read raw body
                if request.body:
                    data = request.body.decode('utf-8', errors='ignore')

            # Scan data for suspicious patterns
            for pattern in self.suspicious_patterns:
                if re.search(pattern, data):
                    logger.warning(f"[SQL Injection Blocked] Suspicious input detected: {data}")
                    return HttpResponseForbidden("Request blocked due to suspected SQL injection attempt.")

        except Exception as e:
            # Log any unexpected errors
            logger.error(f"Error in SQLInjectionMiddleware: {str(e)}")

        # Continue to next middleware or view
        return self.get_response(request)
