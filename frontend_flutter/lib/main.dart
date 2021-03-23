import 'package:flutter/material.dart';
import 'package:frontend_flutter/model/model.dart';
import 'package:frontend_flutter/screens/addToDo.dart';
import 'package:provider/provider.dart';

import 'api/api.dart';
import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
