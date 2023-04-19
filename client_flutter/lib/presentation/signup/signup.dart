import 'package:client_flutter/app/app.dart';
import 'package:client_flutter/presentation/signup/widgets/signup_screen.dart';
import 'package:client_flutter/presentation/signup/widgets/signup_student.dart';
import 'package:client_flutter/presentation/signup/widgets/signup_teacher.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>  {
  final PageController _pageController = PageController(initialPage: 1);

  void goToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      SignUpTeacher(backPageView: () => goToPage(1)),
      SignUpScreen(
        backPageView: () => goToPage(0),
        forwardPageView: () => goToPage(2),
      ),
      SignUpStudent(backPageView: () => goToPage(1)),
    ];

    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
        ),
      ),
    );
  }
}
