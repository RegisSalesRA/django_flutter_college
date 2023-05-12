import 'package:client_flutter/app/app.dart';
import 'package:flutter/material.dart'; 
import '../../data/data.dart';
import 'widgets/settings_card.dart';

class SettingsUser extends StatelessWidget {
  const SettingsUser({super.key});

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
              SettingsCard(
                data: userData.user.toString(),
                hintText: 'Username',
                icon: const Icon(Icons.account_box_rounded),
              ),
              const SizedBox(
                height: 25,
              ),
              SettingsCard(
                data: userData.name.toString(),
                hintText: 'Name',
                icon: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 25,
              ),
              SettingsCard(
                data: userData.phone.toString(),
                hintText: 'Phone',
                icon: const Icon(Icons.phone),
              ),
            ]),
      ),
    );
  }
}
