import 'dart:io';

import 'package:flutter/material.dart';

import '../../app/app.dart';
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
        method: HttpMethods.post,
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
    if (error.type == DioErrorType.connectTimeout) {
      return 'connect Timeout';
    }
    if (error.type == DioErrorType.sendTimeout) {
      return 'connect SendTimeout';
    }
    if (error.type == DioErrorType.receiveTimeout) {
      return 'receive Timeout';
    }
  } on SocketException catch (error) {
    String? token = await readSecureData('token');
    await deleteSecureData(StorageItem('token', token!));
    Navigator.of(Routes.navigatorKey!.currentContext!)
        .pushReplacementNamed(Routes.initial);
    debugPrint('No internet connection $error');
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
        method: HttpMethods.post,
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
    if (error.type == DioErrorType.connectTimeout) {
      return 'connect Timeout';
    }
    if (error.type == DioErrorType.sendTimeout) {
      return 'connect SendTimeout';
    }
    if (error.type == DioErrorType.receiveTimeout) {
      return 'receive Timeout';
    }
  } on SocketException catch (error) {
    String? token = await readSecureData('token');
    await deleteSecureData(StorageItem('token', token!));
    Navigator.of(Routes.navigatorKey!.currentContext!)
        .pushReplacementNamed(Routes.initial);
    debugPrint('No internet connection $error');
  } catch (error) {
    debugPrint('error: $error');
  }
}
