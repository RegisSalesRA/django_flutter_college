import 'package:client_flutter/app/constant/address.dart';
import 'package:client_flutter/data/data/storage_data.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<bool> loginUser() async {
  var data = {'username': "studentNew", 'password': 'studentpassword'};
  try {
    final response = await dio.request('$baseUrl/api/token/',
        options: Options(
          method: 'POST',
        ),
        data: data);
    if (response.statusCode == 200) {
      await writeSecureData(StorageItem('token', response.data["access"]));
      return true;
    }
  } catch (e) {
    print(e);
  }
  return false;
}
