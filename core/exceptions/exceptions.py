def except_error_response(err):
    data = err.__dict__
    if hasattr(data, "detail"):
        err_data = {
            "error": data["detail"],
            "status_code": err.status_code,
        }
        return err_data
    return data
