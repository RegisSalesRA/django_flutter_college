import '../../app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../data/data.dart';

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
    debugPrint('err $e');
  }
}

