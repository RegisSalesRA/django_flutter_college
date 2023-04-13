import 'package:client_flutter/presentation/signup/widgets/signup_student.dart';
import 'package:client_flutter/presentation/signup/widgets/signup_teacher.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final PageController _pageController = PageController(initialPage: 0);

  void goToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      SignUpTeacher(backPageView: () => goToPage(1)),
      Container(
        color: Colors.green,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => goToPage(0),
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 100,
            ),
            InkWell(
              onTap: () => goToPage(2),
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
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
