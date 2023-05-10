import 'package:client_flutter/domain/domain.dart';
import 'package:flutter/cupertino.dart';
import '../data/get_user.dart';

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
    var request = await getCurrentUser();
    currentUser = UserModel.fromJson(request);
    notifyListeners();
  }

  Future<void> init() async {
    isLoading.value = true;
    await functionGetCurrentUserLoggedRepository();
    isLoading.value = false;
    notifyListeners();
  }
}
