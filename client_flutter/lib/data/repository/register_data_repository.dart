import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        print(result);
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
          if (result.containsKey('result')) {
            await Future.delayed(const Duration(seconds: 4));
            Fluttertoast.showToast(
                msg: result["result"].toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            if (mounted) {
              cleanFields();
              Navigator.pushReplacementNamed(context, Routes.initial);
            }
          } else if (result.containsKey('error')) {
            await Future.delayed(const Duration(seconds: 4));
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
          if (result.containsKey('result')) {
            await Future.delayed(const Duration(seconds: 4));
            Fluttertoast.showToast(
                msg: result["result"].toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            if (mounted) {
              cleanFields();
              Navigator.pushReplacementNamed(context, Routes.initial);
            }
          }
          if (result.containsKey('error')) {
            await Future.delayed(const Duration(seconds: 4));
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
      isLoading.value = false;
    }
  }
}
