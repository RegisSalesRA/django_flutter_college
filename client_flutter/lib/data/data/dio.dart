import 'package:dio/dio.dart';

final options = BaseOptions(
  connectTimeout: 5000,
);

final dio = Dio(options);
