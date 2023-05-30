import 'package:client_flutter/ui/signup/widgets/signup_screen.dart';
import 'package:client_flutter/ui/signup/widgets/signup_student.dart';
import 'package:client_flutter/ui/signup/widgets/signup_teacher.dart';
import 'package:flutter/material.dart';

import '../../data/controllers/register_data_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _registerData = RegisterDataController();

  @override
  Widget build(BuildContext context) {
    final pages = [
      SignUpTeacher(backPageView: () => _registerData.goToPage(1)),
      SignUpScreen(
        backPageView: () => _registerData.goToPage(0),
        forwardPageView: () => _registerData.goToPage(2),
      ),
      SignUpStudent(backPageView: () => _registerData.goToPage(1)),
    ];

    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _registerData.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
        ),
      ),
    );
  }
}
