import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../data/data.dart';

Future getCurrentUser() async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });

  try {
    final response = await dio.request(
      '/api/user/',
      options: Options(
          validateStatus: (status) => true,
          method: HttpMethods.get,
          headers: defaultHeaders,
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 10)),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Your session has expired');
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
