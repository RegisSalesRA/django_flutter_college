import 'package:client_flutter/data/data/register_data.dart';
import 'package:client_flutter/data/data/storage_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../app/app.dart';

final dio = Dio();

Future getCurrentUser() async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });

  try {
    final response = await dio.request(
      '$baseUrl/api/user/',
      options: Options(
        validateStatus: (status) => true,
        method: 'GET',
        headers: defaultHeaders,
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    }
    if (response.statusCode == 400) {
      return exceptErrorResponse(response.data);
    }

    if (response.statusCode == 401) {
      return exceptErrorResponse(response.data);
    }
  } on DioError catch (error) {
    debugPrint('Dio error: $error');
    return error.response?.data ?? {};
  } catch (error) {
    debugPrint('error: $error');
  }
}
