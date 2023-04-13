import 'package:flutter/material.dart';

import '../../../app/colors/colors.dart';
import '../../../app/helpers/media_size_helper.dart';
import '../../common/grid_widget.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback backPageView;
  final VoidCallback forwardPageView;
  const SignUpScreen(
      {super.key, required this.backPageView, required this.forwardPageView});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign-up Page"),
      ),
      body: Container(
        height: MediaQuerySize.heightSize(context),
        width: double.infinity,
        color: ColorsTheme.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridComponent(
              voidCall: widget.forwardPageView,
              icon: const Icon(
                Icons.school_outlined,
                size: 110,
              ),
              text_1: "Register",
              text_2: "Student",
            ),
            GridComponent(
              voidCall: widget.backPageView,
              icon: const Icon(
                Icons.person_outlined,
                size: 110,
              ),
              text_1: "Register",
              text_2: "Teacher",
            ),
          ],
        ),
      ),
    );
  }
}
