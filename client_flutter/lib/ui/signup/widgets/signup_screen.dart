import 'package:flutter/material.dart';
import '../../../app/app.dart';
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
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_upward,
            color: ColorsTheme.secondaryColor,
          ),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, Routes.initial),
        ),
        title: const Text(
          "Sign-up Page",
          style: TextStyle(color: ColorsTheme.secondaryColor),
        ),
      ),
      body: SizedBox(
        height: MediaQuerySize.heigthSizeCustom(context),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GridComponent(
                voidCall: widget.forwardPageView,
                nameImage: "student_register.png",
                text_1: "Register",
                text_2: "Student",
              ),
              SizedBox(
                height: MediaQuerySize.heigthSizeCustom(context) / 10,
              ),
              GridComponent(
                voidCall: widget.backPageView,
                nameImage: "teacher_register.png",
                text_1: "Register",
                text_2: "Teacher",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
