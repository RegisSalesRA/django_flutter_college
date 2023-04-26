import 'package:client_flutter/app/app.dart';
import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../../../domain/domain.dart';

class DrawerWidget extends StatelessWidget {
  final dynamic userData;
  const DrawerWidget({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      "Welcome",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "User - ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userData.user,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              final userDataGet = UserModel(
                user: userData.user,
                id: userData.id,
                idTeacher: userData.idTeacher,
                idStudent: userData.idStudent,
                name: userData.name,
                isStudent: userData.isStudent,
                isTeacher: userData.isTeacher,
                phone: userData.phone,
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
  }
}
