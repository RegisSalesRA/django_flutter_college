import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../app/colors/colors.dart';
import '../../app/routes/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> onSave() async {
    if (formKey.currentState!.validate()) {
      await Navigator.pushReplacementNamed(context, Routes.home);
    } else {
      print("Nao valido");
    }
  }

  final dio = Dio();

  Future teacherList() async {
    try {
      final response =
          await dio.get('http://192.168.100.186:8000/api/teacher/');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/image_login.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Hello Again !",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Welcome back you have been missed !",
                          style: Theme.of(context).textTheme.headline3),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Username",
                                  style: Theme.of(context).textTheme.headline2),
                              TextFormField(
                                controller: usernameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    hintText: 'Username'),
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return "Title can not be null or empty";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Password",
                                  style: Theme.of(context).textTheme.headline2),
                              TextFormField(
                                controller: passwordController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: InkWell(
                                      child: Icon(Icons.visibility),
                                    ),
                                    hintText: 'Password'),
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return "Title can not be null or empty";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            child: Text(
                              "Forget password ?",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () async {
                              // teacherList();
                              // loginUser();
                              onSave();
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Don't have an account ? "),
                            InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, Routes.register),
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    color: ColorsTheme.secondaryColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
