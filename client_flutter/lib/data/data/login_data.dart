import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../data/data.dart';

Future loginUser(data) async {
  try {
    final response = await dio.request('/api/token/',
        options: Options(
          validateStatus: (status) => true,
          method: HttpMethods.post,
        ),
        data: data);
    if (response.statusCode == 200) {
      await writeSecureData(StorageItem('token', response.data["access"]));
      Map<String, dynamic> success = {"success": "login user with success"};
      return success;
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Your session has expired');
    } else if (response.statusCode == 400) {
      throw BadRequestException('Data is not valid');
    } else {
      throw ApiException('Request failed with status: ${response.statusCode}');
    }
  } on DioError catch (error) {
    if (error.type == DioErrorType.connectionTimeout) {
      throw TimeoutException('Connection timeout');
    } else if (error.type == DioErrorType.sendTimeout) {
      throw TimeoutException('Send timeout');
    } else if (error.type == DioErrorType.receiveTimeout) {
      throw TimeoutException('Receive timeout');
    } else {
      throw ApiException('Request failed with error: ${error.message}');
    }
  } on SocketException catch (error) {
    debugPrint('SocketException error: $error');
    throw NoInternetException('No internet connection');
  } catch (error) {
    debugPrint('Unhandled error: $error');
    rethrow;
  }
}
