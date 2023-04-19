import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  Future<void> onSaveTeacher() async {
    isLoading.value = !isLoading.value;
    if (formKeyTeacher.currentState!.validate()) {
      var data = {
        "username": usernameController.text,
        "phone": phoneController.text,
        "password": passwordController.text,
        "password2": password2Controller.text,
      };
      var result = await registerTeacher(data);
      if (result!.containsKey('result')) {
        await Future.delayed(const Duration(seconds: 4));
        Fluttertoast.showToast(
            msg: result["result"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        cleanFields();
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
    isLoading.value = !isLoading.value;
  }

  Future<void> onSaveStudent() async {
    isLoading.value = !isLoading.value;
    if (formKeyStudent.currentState!.validate()) {
      var data = {
        "username": usernameController.text,
        "phone": phoneController.text,
        "name": nameController.text,
        "password": passwordController.text,
        "password2": password2Controller.text,
      };
      var result = await registerStudent(data);
      if (result!.containsKey('result')) {
        await Future.delayed(const Duration(seconds: 4));
        Fluttertoast.showToast(
            msg: result["result"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        cleanFields();
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
    isLoading.value = !isLoading.value;
  }
}
