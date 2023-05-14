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

  Future<void> loginUserRepository(context) async {
    isLoading.value = true;
    if (formKeyLogin.currentState!.validate()) {
      Map data = {
        "username": usernameController.text,
        "password": passwordController.text,
      };
      try {
        await Future.delayed(const Duration(seconds: 3));
        var result = await loginUser(data); 
        if (result is String) {
          Fluttertoast.showToast(
              msg: result,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (result is Map) {
          if (result.containsKey('success')) {
            clearFields();
            Navigator.pushReplacementNamed(context, Routes.home);
          } else if (result.containsKey('error')) {
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
      } catch (e) {
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    isLoading.value = false;
  }
}
