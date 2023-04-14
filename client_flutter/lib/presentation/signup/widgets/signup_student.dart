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
  final passwordController = TextEditingController();

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
      body: Container(
        height: MediaQuerySize.heightSize(context),
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: widget.backPageView,
                    child: const Icon(Icons.arrow_back)),
              ),
            ),
            Image.asset(
              "assets/images/pngegg.png",
              height: 285,
            ),
            const SizedBox(
              height: 50,
            ),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                    text: 'Student',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black)),
                TextSpan(
                  text: " Signup",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ]),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              child: Column(children: [
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.black)),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.black)),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.black)),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ]),
            ),
            const SizedBox(
              height: 150,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () {},
                child: const Text("Sign Up"),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
