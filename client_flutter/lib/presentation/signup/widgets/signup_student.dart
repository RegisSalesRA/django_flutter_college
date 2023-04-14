import 'package:client_flutter/app/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../app/helpers/media_size_helper.dart';

class SignUpStudent extends StatefulWidget {
  final VoidCallback backPageView;
  const SignUpStudent({
    super.key,
    required this.backPageView,
  });

  @override
  State<SignUpStudent> createState() => _SignUpStudentState();
}

class _SignUpStudentState extends State<SignUpStudent> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
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
        backgroundColor: ColorsTheme.secondaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: widget.backPageView,
        ),
        title: const Text(
          "Signup Student",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuerySize.heigthSizeCustom(context),
        decoration: const BoxDecoration(
          color: ColorsTheme.secondaryColor,
        ),
        child: Container(
          margin: EdgeInsets.only(
              top: MediaQuerySize.heigthSizeCustom(context) * 0.10),
          height: MediaQuerySize.heigthSizeCustom(context) * 0.90,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                    color: ColorsTheme.secondaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
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
                      controller: nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_rounded),
                          hintText: 'Name'),
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
                height: 75,
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
        ),
      ),
    );
  }
}
