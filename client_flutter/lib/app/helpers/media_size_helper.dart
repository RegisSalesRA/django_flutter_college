import 'package:flutter/material.dart';

abstract class MediaQuerySize {
  static double heigthSizeCustom(context) {
    var heigthSize = MediaQuery.of(context).size.height -
        AppBar(
          automaticallyImplyLeading: false,
        ).preferredSize.height -
        MediaQuery.of(context).padding.top;
    return heigthSize;
  }

  static double heightSize(context) {
    var heigthSize =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return heigthSize;
  }

  static double widthSize(context) {
    var widthSize = MediaQuery.of(context).size.width;
    return widthSize;
  }
}
