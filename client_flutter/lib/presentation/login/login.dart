import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../../data/repository/login_data_repository.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with ValidationMixin {
  final loginData = LoginRepository();

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
                        key: loginData.formKeyLogin,
                        child: Column(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Username",
                                  style: Theme.of(context).textTheme.headline2),
                              TextFormField(
                                controller: loginData.usernameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    hintText: 'Username'),
                                validator: inputCanNotBeEmptyOrNull,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ]),
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: loginData.confirmPassword,
                        builder: (context, isLoading, child) {
                          return TextFormField(
                            controller: loginData.passwordController,
                            obscureText: loginData.confirmPassword.value,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      loginData.confirmPassword.value =
                                          !loginData.confirmPassword.value;
                                    },
                                    icon: Icon(loginData.confirmPassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                                prefixIcon: const Icon(Icons.lock),
                                hintText: 'Password'),
                            validator: passwordValidateLength,
                          );
                        },
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
                        ValueListenableBuilder<bool>(
                            valueListenable: loginData.isLoading,
                            builder: (context, isLoading, child) {
                              return SizedBox(
                                width: 350,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                  onPressed: loginData.isLoading.value
                                      ? null
                                      : () async {
                                          FocusScope.of(context).unfocus();
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          loginData
                                              .loginUserRepository(context);
                                        },
                                  child: loginData.isLoading.value
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          "Login",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                ),
                              );
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Don't have an account ? "),
                            InkWell(
                              onTap: () => Navigator.pushReplacementNamed(
                                  context, Routes.register),
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
