import 'package:flutter/material.dart';

import '../../../app/colors/colors.dart';

class SignUpTeacher extends StatefulWidget {
  final VoidCallback backPageView;
  const SignUpTeacher({super.key, required this.backPageView});

  @override
  State<SignUpTeacher> createState() => _SignUpTeacherState();
}

class _SignUpTeacherState extends State<SignUpTeacher> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  Future<void> onSave() async {
    if (formKey.currentState!.validate()) {
      print("Validoo");
    } else {
      print("Nao valido");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white10,
        elevation: 0,
        centerTitle: true,
        actions: [
          Row(
            children: [
              Container(),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: ColorsTheme.secondaryColor,
                ),
                onPressed: widget.backPageView,
              )
            ],
          )
        ],
        title: const Text(
          "Signup Teacher",
          style: TextStyle(color: ColorsTheme.secondaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          Form(
            key: formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person), hintText: 'Username'),
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Title can not be null or empty";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: phoneController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone), hintText: 'Phone'),
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Title can not be null or empty";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      suffixIcon: InkWell(
                        child: Icon(Icons.visibility),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password'),
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Title can not be null or empty";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: password2Controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      suffixIcon: InkWell(
                        child: Icon(Icons.visibility),
                      ),
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      hintText: 'Confirm Password'),
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Title can not be null or empty";
                    }
                    return null;
                  },
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 175,
          ),
          SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                onSave();
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
