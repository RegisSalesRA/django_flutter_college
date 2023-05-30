import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../repository/login_data_repository.dart';

class LoginController {
  static final LoginController _instance = LoginController._();

  factory LoginController() => _instance;

  LoginController._();

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

  Future<void> loginUserController(context) async {
    isLoading.value = true;
    Map data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };

    await LoginDataRepository.loginUserRepository(context, formKeyLogin, data);

    isLoading.value = false;
  }
}
