import 'package:flutter/material.dart';

abstract class ColorsTheme {
  static const MaterialColor themeColor = MaterialColor(
    0xff33717e,
    <int, Color>{
      50: Color(0xFF004999), //10%
      100: Color(0xFF004999), //20%
      200: Color(0xFF00254d), //30%
      300: Color(0xFF00254d), //40%
      400: Color(0xFF00254d), //50%
      500: Color(0xFF021338), //60%
      600: Color(0xFF021338), //70%
      700: Color(0xFF021338), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const Color primaryColor = Color(0xFF85c1cc);
  static const Color secondaryColor = Color(0xFF33717e);
  static Color backgroundColor = Colors.grey.shade300;
  //static const Color backgroundColor = Color(0xFF343742);
  static Color backgroundContainerColor = Colors.grey.shade200;
  //static Color backgroundContainerSignUp = Colors.blue.shade100;
  static const Color backgroundContainerSignUp = Color(0xFF356894);
  static const Color iconColor = Color(0xFF85c1cc);
  static const Color splashColor = Color(0xFF0e0917);
  static const Color splashColorExtra = Color(0xFF1a1432);
}
//7eb9cb