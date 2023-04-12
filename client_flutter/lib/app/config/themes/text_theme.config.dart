import 'package:flutter/material.dart';

import '../../colors/colors.dart';

TextTheme textThemeConfig() {
  return TextTheme(
    headline1: const TextStyle(
      fontSize: 22,
      color: ColorsTheme.secondaryColor,
      fontWeight: FontWeight.bold,
    ),
    headline2: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 18,
        color: ColorsTheme.secondaryColor,
        fontWeight: FontWeight.bold),
    headline3: TextStyle(
      fontSize: 16,
      color: Colors.grey.shade400,
    ),
    headline4: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 15,
        color: ColorsTheme.secondaryColor,
        fontWeight: FontWeight.bold),
    headline5: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 20,
        color: Colors.black,
        decoration: TextDecoration.lineThrough),
    headline6: const TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 22,
      color: ColorsTheme.primaryColor,
    ),
  );
}
