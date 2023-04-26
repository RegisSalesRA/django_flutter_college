import 'package:client_flutter/app/app.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import 'widgets/config_card.dart';

class MyConfigScreen extends StatelessWidget {
  const MyConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userData = ModalRoute.of(context)?.settings.arguments as UserModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("MyConfig Screen"),
      ),
      body: SizedBox(
        height: MediaQuerySize.heigthSizeCustom(context),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              userData.isStudent
                  ? CardConfig(
                      title: "Student:",
                      content: userData.phone.toString(),
                    )
                  : CardConfig(
                      title: "Teacher:",
                      content: userData.phone.toString(),
                    ),
              const SizedBox(
                height: 150,
              ),
              CardConfig(
                title: "Username:",
                content: userData.user.toString(),
              ),
              const SizedBox(
                height: 25,
              ),
              CardConfig(
                title: "Name:",
                content: userData.name.toString(),
              ),
              const SizedBox(
                height: 25,
              ),
              CardConfig(
                title: "Phone:",
                content: userData.phone.toString(),
              ),
              const SizedBox(
                height: 25,
              ),
            ]),
      ),
    );
  }
}
