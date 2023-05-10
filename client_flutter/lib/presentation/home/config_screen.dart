import 'package:client_flutter/app/app.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class MyConfigScreen extends StatelessWidget {
  const MyConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userData = ModalRoute.of(context)?.settings.arguments as UserModel;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            userData.isStudent ? "Student Info" : 'Teacher Info',
            style: const TextStyle(color: ColorsTheme.primaryColor),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: ColorsTheme.primaryColor)),
      body: SizedBox(
        height: MediaQuerySize.heigthSizeCustom(context),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: userData.user.toString(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: const Icon(Icons.phone),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: userData.name.toString(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: const Icon(Icons.phone),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      hintText: userData.phone.toString(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: const Icon(Icons.phone),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      )),
                ),
              )
            ]),
      ),
    );
  }
}
