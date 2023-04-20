import 'package:client_flutter/data/repository/get_user_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../repository/discipline_repository.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => GetCurrentUserProvider()),
  ChangeNotifierProvider(create: (context) => DisciplineProvider()),
];
