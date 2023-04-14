import 'package:flutter/material.dart';

import '../../../app/colors/colors.dart';
import '../../../app/helpers/media_size_helper.dart';
import '../../../app/routes/routes.dart';
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
        backgroundColor: ColorsTheme.secondaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pushNamed(context, Routes.initial),
        ),
        title: const Text(
          "Sign-up Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuerySize.heigthSizeCustom(context),
        decoration: const BoxDecoration(
          color: ColorsTheme.secondaryColor,
        ),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
              top: MediaQuerySize.heigthSizeCustom(context) * 0.10),
          height: MediaQuerySize.heigthSizeCustom(context) * 0.90,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
      ),
    );
  }
}
