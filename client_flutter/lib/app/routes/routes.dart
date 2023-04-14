import 'package:client_flutter/presentation/signup/signup.dart';
import 'package:flutter/material.dart';

import '../../presentation/home/home_screen.dart';
import '../../presentation/login/login.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/': (context) => const Login(),
    '/register': (context) => const SignUp(),
    '/home': (context) => const HomeScreen(),
  };

  static String initial = '/';
  static String register = '/register';
  static String home = '/home';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
