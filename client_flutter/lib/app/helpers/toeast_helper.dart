import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastHelper(request, bool error) {
  var value = Fluttertoast.showToast(
      msg: request,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);

  return value;
}
