import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../app/app.dart';
import '../../data/data.dart';

Future getDisciplineByTeacher() async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });

  try {
    final response = await dio.request(
      '/api/discipline_teacher/',
      options: Options(
          validateStatus: (status) => true,
          method: HttpMethods.get,
          headers: defaultHeaders),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Your session has expired');
    } else if (response.statusCode == 400) {
      throw BadRequestException('Wrong Data');
    } else {
      throw ApiException('Request failed with status: ${response.statusCode}');
    }
  } on DioError catch (error) {
    if (error.type == DioErrorType.connectTimeout) {
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

Future getDisciplineByStudent() async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });

  try {
    final response = await dio.request(
      '/api/discipline_student/',
      options: Options(
          validateStatus: (status) => true,
          method: HttpMethods.get,
          headers: defaultHeaders),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Your session has expired');
    } else if (response.statusCode == 400) {
      throw BadRequestException('Wrong Data');
    } else {
      throw ApiException('Request failed with status: ${response.statusCode}');
    }
  } on DioError catch (error) {
    if (error.type == DioErrorType.connectTimeout) {
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

Future getScoreDisciplineByStudent() async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });

  try {
    final response = await dio.request(
      '/api/discipline_score_student/',
      options: Options(
          validateStatus: (status) => true,
          method: HttpMethods.get,
          headers: defaultHeaders),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Your session has expired');
    } else {
      throw ApiException('Request failed with status: ${response.statusCode}');
    }
  } on DioError catch (error) {
    if (error.type == DioErrorType.connectTimeout) {
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

Future getDisciplineAvailibleByStudent() async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });

  try {
    final response = await dio.request(
      '/api/discipline_left_student/',
      options: Options(
          validateStatus: (status) => true,
          method: HttpMethods.get,
          headers: defaultHeaders),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Your session has expired');
    } else {
      throw ApiException('Request failed with status: ${response.statusCode}');
    }
  } on DioError catch (error) {
    if (error.type == DioErrorType.connectTimeout) {
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

Future insertScoreToStudent(data) async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });
  try {
    final response = await dio.request('/api/score_add_student/',
        options: Options(
            validateStatus: (status) => true,
            method: HttpMethods.post,
            headers: defaultHeaders),
        data: data);

    if (response.statusCode == 201) {
      return response.data;
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Your session has expired');
    } else {
      throw ApiException('Request failed with status: ${response.statusCode}');
    }
  }
  
   on DioError catch (error) {
    if (error.type == DioErrorType.connectTimeout) {
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

Future getScoreApi() async {
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
  });

  try {
    final response = await dio.request(
      '/api/score/',
      options: Options(
          validateStatus: (status) => true,
          method: HttpMethods.get,
          headers: defaultHeaders),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Your session has expired');
    } else {
      throw ApiException('Request failed with status: ${response.statusCode}');
    }
  } on DioError catch (error) {
    if (error.type == DioErrorType.connectTimeout) {
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

Future disciplineChosedByStudent(data) async {
  final token = await readSecureData('token');
  final defaultHeaders = ({
    "Content-Type": "application/json",
    "accept": "application/json",
    'Authorization': "Bearer $token",
  });

  try {
    final response = await dio.request('/api/discipline_chose/',
        options: Options(
          validateStatus: (status) => true,
          method: HttpMethods.post,
          headers: defaultHeaders,
        ),
        data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 401) {
      throw AuthenticationException('Your session has expired');
    } else if (response.statusCode == 400) {
      throw BadRequestException('Wrong Data');
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
