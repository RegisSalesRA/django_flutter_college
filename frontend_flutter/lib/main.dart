import 'package:flutter/material.dart';
import 'package:frontend_flutter/screens/homepage.dart';
import 'package:provider/provider.dart';

import 'api/api_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (ctx) => CadastroProvider()),
        //    ChangeNotifierProvider(create: (ctx) => CadastroFastProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {},
      ),
    );
  }
}
