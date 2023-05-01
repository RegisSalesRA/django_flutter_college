import 'package:client_flutter/app/constant/address.dart';
import 'package:dio/dio.dart';
import '../../data/data.dart';

Future getDisciplineByTeacher() async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });

  final response = await dio.request(
    '$baseUrl/api/discipline_teacher/',
    options: Options(
        validateStatus: (status) => true,
        method: 'GET',
        headers: defaultHeaders),
  );

  if (response.statusCode == 200) {
    return response.data;
  }
  if (response.statusCode == 401) {
    return exceptErrorResponse(response.data);
  }
  if (response.statusCode == 400) {
    return exceptErrorResponse(response.data);
  }
}

Future getDisciplineByStudent() async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });

  final response = await dio.request(
    '$baseUrl/api/discipline_student/',
    options: Options(
        validateStatus: (status) => true,
        method: 'GET',
        headers: defaultHeaders),
  );

  if (response.statusCode == 200) {
    return response.data;
  }
  if (response.statusCode == 401) {
    return exceptErrorResponse(response.data);
  }
  if (response.statusCode == 400) {
    return exceptErrorResponse(response.data);
  }
}

Future insertScoreToStudent(data) async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });

  final response = await dio.request('$baseUrl/api/score_add_student/',
      options: Options(
          validateStatus: (status) => true,
          method: 'POST',
          headers: defaultHeaders),
      data: data);

  if (response.statusCode == 201) {
    return response.data;
  }
  if (response.statusCode == 401) {
    return exceptErrorResponse(response.data);
  }
  if (response.statusCode == 400) {
    return {
      'error': "Check if your text field are empty or is a number",
      'status_code': data['status_code']
    };
  }
}

Future getScoreApi() async {
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
  });

  final response = await dio.request(
    '$baseUrl/api/score/',
    options: Options(
        validateStatus: (status) => true,
        method: 'GET',
        headers: defaultHeaders),
  );

  if (response.statusCode == 200) {
    return response.data;
  }
  if (response.statusCode == 401) {
    return exceptErrorResponse(response.data);
  }
  if (response.statusCode == 400) {
    return exceptErrorResponse(response.data);
  }
}
