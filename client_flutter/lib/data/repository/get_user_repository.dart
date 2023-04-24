import 'package:flutter/cupertino.dart';

import '../../domain/model/user_model.dart';
import '../data/get_user.dart';

class GetCurrentUserRepository with ChangeNotifier {
  dynamic currentStudent;

  Future<dynamic> functionGetCurrentUserLogged() async {
    var request = await getCurrentUser();
    currentStudent = UserModel.fromJson(request);
    notifyListeners();
  }

  Future<void> init() async {
    await functionGetCurrentUserLogged();
    notifyListeners();
  }
}
