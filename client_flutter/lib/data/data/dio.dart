import 'package:dio/dio.dart';



final options = BaseOptions(
  baseUrl: "http://10.0.2.2:8000",
  connectTimeout: 5000,
);

final dio = Dio(options);
