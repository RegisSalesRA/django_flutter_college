import 'package:flutter/material.dart';

import '../../../app/routes/routes.dart';
import '../../../data/data/storage_data.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('John Doe'),
                accountEmail: Text('johndoe@example.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('JD'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('My Account'),
                onTap: () {},
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('About Us'),
                onTap: () {},
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () async {
                  Navigator.pushReplacementNamed(context, Routes.initial);
                  String? token = await readSecureData('token');
                  await deleteSecureData(StorageItem('token', token!));
                },
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
