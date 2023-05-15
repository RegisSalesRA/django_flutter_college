import 'package:flutter/material.dart';

import '../../app/helpers/toeast_helper.dart';
import '../../app/routes/routes.dart';
import '../data/register_data.dart';

class RegisterDataRepository {
  static final RegisterDataRepository _instance = RegisterDataRepository._();

  factory RegisterDataRepository() => _instance;

  RegisterDataRepository._();

  final ValueNotifier<bool> confirmPassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> confirm2Password = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final formKeyTeacher = GlobalKey<FormState>();
  final formKeyStudent = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  void cleanFields() {
    usernameController.clear();
    nameController.clear();
    phoneController.clear();
    passwordController.clear();
    password2Controller.clear();
    confirmPassword.value = true;
    confirm2Password.value = true;
  }

  final PageController pageController = PageController(initialPage: 1);

  void goToPage(int pageIndex) {
    cleanFields();
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  Future<void> onSaveTeacherRepository(
      BuildContext context, bool mounted) async {
    isLoading.value = true;
    if (formKeyTeacher.currentState!.validate()) {
      var data = {
        "username": usernameController.text,
        "phone": phoneController.text,
        "password": passwordController.text,
        "name": nameController.text,
        "password2": password2Controller.text,
      };
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
              cleanFields();
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
    isLoading.value = false;
  }

  Future<void> onSaveStudentRepository(
      BuildContext context, bool mounted) async {
    isLoading.value = true;
    if (formKeyStudent.currentState!.validate()) {
      var data = {
        "username": usernameController.text,
        "phone": phoneController.text,
        "name": nameController.text,
        "password": passwordController.text,
        "password2": password2Controller.text,
      };
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
              cleanFields();
              Navigator.pushReplacementNamed(context, Routes.initial);
            }
          }
          if (result.containsKey('error')) {
            await Future.delayed(const Duration(seconds: 4));
            toastHelper(result["error"].toString(), true);
          }
        }
      } catch (e) {
        toastHelper(e.toString(), true);
      }
      isLoading.value = false;
    }
  }
}
