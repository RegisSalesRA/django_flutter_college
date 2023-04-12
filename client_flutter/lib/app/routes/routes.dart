import 'package:client_flutter/presentation/signup/signup.dart';
import 'package:flutter/material.dart';

import '../../presentation/login/login.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/': (context) => const Login(),
    '/register': (context) => const SignUp(),
  };

  static String initial = '/';
  static String register = '/register';
  static String chart = '/chart';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
