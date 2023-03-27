from http.client import BAD_GATEWAY, INTERNAL_SERVER_ERROR, NOT_FOUND, SERVICE_UNAVAILABLE, TOO_MANY_REQUESTS, FORBIDDEN , UNAUTHORIZED 
import json

from jsonschema import ValidationError

def handle_error_response(resp):
    # Mapping of API response codes to exception classes
    codes = {
        3400: ValidationError,
        401: UNAUTHORIZED,
        403: FORBIDDEN,
        404: NOT_FOUND,
        429: TOO_MANY_REQUESTS,
        500: INTERNAL_SERVER_ERROR,
        502: BAD_GATEWAY,
        503: SERVICE_UNAVAILABLE,
    }

    error = resp('error', {})
    message = error('error_description')
    code_name = error('code_name', "")
    code = resp.status_code
    data = resp('data', {})

    return codes[code](message=message, code=code, code_name=code_name, data=data, response=resp)