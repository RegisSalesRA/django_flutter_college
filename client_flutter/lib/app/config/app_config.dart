// ignore_for_file: avoid_unnecessary_containers

import 'package:client_flutter/app/config/themes/theme_data.dart';
import 'package:client_flutter/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/data/storage_data.dart';
import '../../ui/login/login.dart';
import '../routes/routes.dart';

class AppConfig extends StatefulWidget {
  const AppConfig({Key? key}) : super(key: key);

  @override
  State<AppConfig> createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    Future<String?> token = readSecureData('token');

    return MaterialApp(
      title: 'Flutter College',
      debugShowCheckedModeBanner: false,
      theme: themeDataMethod(),
      home: FutureBuilder<String?>(
        future: token,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.waiting:
              return Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasData && !snapshot.hasError) {
                return const HomeScreen();
              }
          }
          return const Login();
        },
      ),
      routes: Routes.list,
      navigatorKey: Routes.navigatorKey,
    );
  }
}
