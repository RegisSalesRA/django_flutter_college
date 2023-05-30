import 'package:flutter/material.dart';

import '../repository/repository.dart';

class RegisterDataController {
  static final RegisterDataController _instance = RegisterDataController._();

  factory RegisterDataController() => _instance;

  RegisterDataController._();

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

  onSaveTeacherController(
    BuildContext context,
    bool mounted,
  ) async {
    var data = {
      "username": usernameController.text,
      "name": nameController.text,
      "phone": phoneController.text,
      "password": passwordController.text,
      "password2": password2Controller.text,
    };
    isLoading.value = true;
    await RegisterDataRepository.onSaveTeacherRepository(
        context, mounted, formKeyTeacher, data, cleanFields);
    isLoading.value = false;
  }

  onSaveStudentController(
    BuildContext context,
    bool mounted,
  ) async {
    var data = {
      "username": usernameController.text,
      "name": nameController.text,
      "phone": phoneController.text,
      "password": passwordController.text,
      "password2": password2Controller.text,
    };

    isLoading.value = true;
    await RegisterDataRepository.onSaveStudentRepository(
        context, mounted, formKeyStudent, data, cleanFields);
    isLoading.value = false;
  }
}
