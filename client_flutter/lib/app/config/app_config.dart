import 'package:client_flutter/app/colors/colors.dart';
import 'package:client_flutter/app/config/themes/text_theme.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../routes/routes.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: 'Flutter College',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(color: ColorsTheme.secondaryColor),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: ColorsTheme.themeColor)
                .copyWith(secondary: ColorsTheme.primaryColor),
        textTheme: textThemeConfig(),
      ),
      initialRoute: Routes.initial,
      routes: Routes.list,
      navigatorKey: Routes.navigatorKey,
    );
  }
}
