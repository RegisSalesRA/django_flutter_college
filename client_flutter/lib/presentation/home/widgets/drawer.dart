import 'package:client_flutter/app/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetCurrentUserRepository>(
      builder: (context, userRepository, _) {
        return Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 150,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: ColorsTheme.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "Welcome",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () {
                  final userDataGet = UserModel(
                    user: userRepository.currentUser.user,
                    id: userRepository.currentUser.id,
                    idTeacher: userRepository.currentUser.idTeacher,
                    idStudent: userRepository.currentUser.idStudent,
                    name: userRepository.currentUser.name,
                    isStudent: userRepository.currentUser.isStudent,
                    isTeacher: userRepository.currentUser.isTeacher,
                    phone: userRepository.currentUser.phone,
                  );
                  Navigator.pushNamed(context, Routes.myconfig,
                      arguments: userDataGet);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  Navigator.pushReplacementNamed(context, Routes.initial);
                  String? token = await readSecureData('token');
                  await deleteSecureData(StorageItem('token', token!));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
