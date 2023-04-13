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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuerySize.heightSize(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/register_screen.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: widget.backPageView,
                    child: const Icon(Icons.arrow_back)),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                    text: 'Student',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white)),
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
