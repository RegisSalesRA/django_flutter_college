import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../data/data.dart';

Future loginUser(data) async {
  try {
    final response = await dio.request('$baseUrl/api/token/',
        options: Options(
          validateStatus: (status) => true,
          method: 'POST',
        ),
        data: data);

    if (response.statusCode == 200) {
      await writeSecureData(StorageItem('token', response.data["access"]));
      Map<String, dynamic> success = {"success": "login user with success"};
      return success;
    }
    if (response.statusCode == 401) {
      return exceptErrorResponse(response.data);
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
