import 'package:client_flutter/data/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: const AppConfig()));
}
