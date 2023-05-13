import 'package:flutter/material.dart';
import '../data.dart';

class GetCurrentUserRepository with ChangeNotifier {
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

  Future<dynamic> functionGetCurrentUserLoggedRepository() async {
    isLoading.value = true;
    var request = await getCurrentUser();

    if (request is! String) {
      currentUser = UserModel.fromJson(request);
    }
    
    isLoading.value = false;
    notifyListeners();
    return request;
  }
}
