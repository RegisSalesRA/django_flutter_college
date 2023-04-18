import 'package:dio/dio.dart';

final dio = Dio();

loginUser() async {
  var data = {'id': 12, 'name': 'dio'};
  try {
    final response =
        await dio.post('http://192.168.100.186:8000/api/token/', data: data);
    print(response);
  } catch (e) {
    print(e);
  }
}

teacherList() async {
  try {
    final response = await dio.get('http://192.168.100.186:8000/api/teacher/');
    print(response);
  } catch (e) {
    print(e);
  }
}
