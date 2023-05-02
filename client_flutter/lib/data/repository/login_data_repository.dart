import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../app/routes/routes.dart';
import '../data/login_data.dart';

class LoginRepository {
  static final LoginRepository _instance = LoginRepository._();

  factory LoginRepository() => _instance;

  LoginRepository._();

  final formKeyLogin = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> confirmPassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final storage = const FlutterSecureStorage();

  clearFields() {
    usernameController.clear();
    passwordController.clear();
  }

  Future loginUserRepository(context) async {
    isLoading.value = !isLoading.value;
    if (formKeyLogin.currentState!.validate()) {
      Map data = {
        "username": usernameController.text,
        "password": passwordController.text,
      };
      var result = await loginUser(data);

      if (result!.containsKey('success')) {
        await Future.delayed(const Duration(seconds: 3));
        clearFields();
        Navigator.pushReplacementNamed(context, Routes.home);
      }
      if (result.containsKey('error')) {
        await Future.delayed(const Duration(seconds: 3));
        Fluttertoast.showToast(
            msg: result["error"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    isLoading.value = !isLoading.value;
  }
}
