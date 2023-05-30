import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../data.dart';

class RegisterDataRepository {
  static Future<void> onSaveTeacherRepository(BuildContext context,
      bool mounted, formKeyTeacher, data, var clean) async {
    if (formKeyTeacher.currentState!.validate()) {
      try {
        var result = await registerTeacher(data);
        if (result is String) {
          toastHelper(result, false);
        }
        if (result is Map) {
          if (result.containsKey('result')) {
            await Future.delayed(const Duration(seconds: 4));

            toastHelper(result["result"].toString(), false);

            if (mounted) {
              Navigator.pushReplacementNamed(context, Routes.initial);
            }
          } else if (result.containsKey('error')) {
            await Future.delayed(const Duration(seconds: 4));
            toastHelper(result["error"].toString(), true);
          }
        }
      } catch (e) {
        toastHelper(e.toString(), true);
      }
    }
  }

  static Future<void> onSaveStudentRepository(BuildContext context,
      bool mounted, formKeyStudent, data, var clean) async {
    if (formKeyStudent.currentState!.validate()) {
      try {
        var result = await registerStudent(data);
        if (result is String) {
          toastHelper(result, false);
        }
        if (result is Map) {
          if (result.containsKey('result')) {
            await Future.delayed(const Duration(seconds: 4));

            toastHelper(result["result"].toString(), false);

            if (mounted) {
              Navigator.pushReplacementNamed(context, Routes.initial);
            }
          } else if (result.containsKey('error')) {
            await Future.delayed(const Duration(seconds: 4));
            toastHelper(result["error"].toString(), true);
          }
        }
      } catch (e) {
        toastHelper(e.toString(), true);
      }
    }
  }
}
