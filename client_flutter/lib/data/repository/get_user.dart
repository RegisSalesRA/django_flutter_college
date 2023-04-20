import 'package:flutter/cupertino.dart';

import '../../domain/model/user_model.dart';
import '../data/get_user.dart';

class GetCurrentUserProvider with ChangeNotifier {
  dynamic currentStudent;

  Future<dynamic> functionGetCurrentUserLogged() async {
    var request = await getCurrentUser();
    currentStudent = UserModel.fromJson(request);
    print("chamando tu aqui");
    notifyListeners();
  }

  Future<void> init() async {
    await functionGetCurrentUserLogged();
    notifyListeners();
    print('MyProvider initialized');
  }
}
