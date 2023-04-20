import 'package:client_flutter/data/repository/get_user.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => GetCurrentUserProvider()),
];
