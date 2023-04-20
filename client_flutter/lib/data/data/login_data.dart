import 'package:client_flutter/app/constant/address.dart';
import 'package:client_flutter/data/data/register_data.dart';
import 'package:client_flutter/data/data/storage_data.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future loginUser(data) async {
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
}
