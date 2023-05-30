import 'package:flutter/material.dart';
import '../data.dart';
import '../repository/repository.dart';

class GetCurrentUserController with ChangeNotifier {
  UserModel currentUser = UserModel(
    id: 0,
    user: '',
    idStudent: 0,
    idTeacher: 0,
    name: '',
    phone: '',
    isTeacher: false,
    isStudent: false,
  );
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future<dynamic> functionGetCurrentUserLoggedController() async {
    isLoading.value = true;
    var request = await GetCurrentUserLooggedRepository
        .functionGetCurrentUserLoggedRepository(currentUser);
    if (request is! String) {
      currentUser = UserModel.fromJson(request);
    }
    isLoading.value = false;
    notifyListeners();
  }
}
