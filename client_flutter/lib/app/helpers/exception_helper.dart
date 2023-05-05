exceptErrorResponse(dynamic err) {
  var data = err;

  if (data['detail'] is String) {
    var errData = {'error': data['detail'], 'status_code': data['status_code']};
    return errData;
  }
  if (data['error'] is String) {
    var errData = {'error': data['error'], 'status_code': data['status_code']};
    return errData;
  }

  if (data['detail']?.containsKey('username') == true) {
    var errData = {
      'error': data['detail']["username"][0],
      'status_code': data['status_code']
    };
    return errData;
  }

  if (data.containsKey('detail')) {
    var errData = {'error': data['detail'], 'status_code': data['status_code']};
    return errData;
  }

  return data;
}
