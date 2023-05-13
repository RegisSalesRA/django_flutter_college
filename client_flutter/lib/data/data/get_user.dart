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
      '$baseUrl/api/user/',
      options: Options(
          validateStatus: (status) => true,
          method: 'GET',
          headers: defaultHeaders,
          sendTimeout: 5000,
          receiveTimeout: 10000),
    );
    if (response.statusCode == 200) {
      return response.data;
    }
    if (response.statusCode == 401) {
      String? token = await readSecureData('token');
      await deleteSecureData(StorageItem('token', token!));
      return "your section expired";
    }
  } on DioError catch (error) {
    if (error.type == DioErrorType.connectTimeout) {
      String? token = await readSecureData('token');
      await deleteSecureData(StorageItem('token', token!));
      return 'connect Timeout';
    }
    if (error.type == DioErrorType.sendTimeout) {
      String? token = await readSecureData('token');
      await deleteSecureData(StorageItem('token', token!));

      return 'connect SendTimeout';
    }
    if (error.type == DioErrorType.receiveTimeout) {
      String? token = await readSecureData('token');
      await deleteSecureData(StorageItem('token', token!));

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
