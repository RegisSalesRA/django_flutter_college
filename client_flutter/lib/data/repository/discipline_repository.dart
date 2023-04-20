import 'package:flutter/cupertino.dart';

import '../../domain/model/discipline_teacher_model.dart';
import '../data/get_discipline.dart';

class DisciplineProvider with ChangeNotifier {
  List disciplineTeacher = [];

  Future getDisciplineByTeacherList() async {
    disciplineTeacher.clear();
    var request = await getDisciplineByTeacher();
    for (var item in request) {
      var discipline = DisciplineTeacherModel.fromJson(item);
      disciplineTeacher.add(discipline);
    }
    print(request);

    notifyListeners();
  }

 // Future<void> init() async {}
}
