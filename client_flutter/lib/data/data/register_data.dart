import 'package:client_flutter/data/data/storage_data.dart';

import '../../app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

final dio = Dio();
final token = readSecureData('token');

final defaultHeaders = ({
  "Content-Type": "application/json",
  'accept': 'application/json',
  'Authorization': 'Bearer $token',
});

Future registerTeacher(data) async {
  try {
    final response = await dio.request(
      '$baseUrl/api/signup/teacher/',
      options: Options(
        validateStatus: (status) => true,
        method: 'POST',
      ),
      data: data,
    );
    if (response.statusCode == 201) {
      return response.data;
    }
    if (response.statusCode == 400) {
      return exceptErrorResponse(response.data);
    }
  } on DioError catch (error) {
    debugPrint('Dio error: $error');
    return error.response?.data ?? {};
  } catch (error) {
    debugPrint('error: $error');
  }
}

Future registerStudent(data) async {
  try {
    final response = await dio.request(
      '$baseUrl/api/signup/student/',
      options: Options(
        validateStatus: (status) => true,
        method: 'POST',
      ),
      data: data,
    );
    if (response.statusCode == 201) {
      return response.data;
    }
    if (response.statusCode == 400) {
      return exceptErrorResponse(response.data);
    }
  } catch (e) {
    print(e);
  }
}

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
