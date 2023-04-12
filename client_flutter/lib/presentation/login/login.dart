import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Image.asset('assets/images/image_login.jpg'),
          const Text("Hello Again !"),
          const Text("Welcome back you have been missed !"),
          Form(
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person), hintText: 'Username'),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock), hintText: 'Password'),
              ),
            ]),
          ),
          const Text("Forget password ?"),
          ElevatedButton(onPressed: () {}, child: const Text("Login")),
          Row(
            children: const [
              Text("Don't have an account ? "),
              InkWell(
                child: Text(
                  "Sign up",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
