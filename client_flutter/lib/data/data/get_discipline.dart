import 'package:client_flutter/app/constant/address.dart';
import 'package:client_flutter/data/data/register_data.dart';
import 'package:client_flutter/data/data/storage_data.dart';
import 'package:dio/dio.dart';

final dio = Dio();

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
    return exceptErrorResponse(response.data);
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
