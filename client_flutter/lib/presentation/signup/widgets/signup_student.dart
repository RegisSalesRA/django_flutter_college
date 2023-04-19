import 'package:flutter/material.dart';

import '../../../app/app.dart';

class SignUpStudent extends StatefulWidget {
  final VoidCallback backPageView;
  const SignUpStudent({
    super.key,
    required this.backPageView,
  });

  @override
  State<SignUpStudent> createState() => _SignUpStudentState();
}

class _SignUpStudentState extends State<SignUpStudent> with ValidationMixin {
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
        backgroundColor: Colors.white10,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsTheme.secondaryColor,
          ),
          onPressed: widget.backPageView,
        ),
        title: const Text(
          "Signup Student",
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
                  validator: inputCanNotBeEmptyOrNull,
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
                  validator: nameValid,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: phoneController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone), hintText: 'Phone'),
                  validator: isPhoneNumberValid,
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
                  validator: passwordValidateLength,
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
                  validator: (value) =>
                      validationMatchingPassword(value, passwordController),
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
