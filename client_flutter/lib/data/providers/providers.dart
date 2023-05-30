import 'package:client_flutter/data/controllers/get_user_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../controllers/discipline_controller.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<GetCurrentUserController>(create: (context) => GetCurrentUserController()),
  ChangeNotifierProvider<DisciplineController>(create: (context) => DisciplineController()),
];
