import '../../app/app.dart';
import 'package:dio/dio.dart';

final dio = Dio();

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
  } catch (e) {
    print(e);
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

Map<String, dynamic> exceptErrorResponse(dynamic err) {
  var data = err;

  if (data['detail'].containsKey('username')) {
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
