import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../data/data.dart';

class LoginDataRepository {
  static Future<void> loginUserRepository(context, formKeyLogin, data) async {
    if (formKeyLogin.currentState!.validate()) {
      try {
        await Future.delayed(const Duration(seconds: 3));
        var result = await loginUser(data);
        if (result is String) {
          toastHelper(result, false);
        }
        if (result is Map) {
          if (result.containsKey('success')) {
            Navigator.pushReplacementNamed(context, Routes.home);
          } else if (result.containsKey('error')) {
            toastHelper(result, false);
          }
        }
      } catch (e) {
        toastHelper(e.toString(), true);
      }
    }
  }
}
