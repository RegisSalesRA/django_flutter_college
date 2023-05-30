import '../data.dart';

class GetCurrentUserLooggedRepository {
  static Future<dynamic> functionGetCurrentUserLoggedRepository(
      currentUser) async {
    var request = await getCurrentUser();
    return request;
  }
}
