import 'package:client_flutter/domain/model/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../domain/model/discipline_teacher_model.dart';
import '../../domain/model/score_model.dart';
import '../data/get_discipline.dart';

class DisciplineProvider with ChangeNotifier {
  List disciplineTeacher = [];
  List scores = [];
  List disciplineTeacherStudentsScore = [];
  List studentScore = [];

  Future getDisciplineByTeacherList() async {
    disciplineTeacher.clear();
    var request = await getDisciplineByTeacher();
    for (var item in request) {
      var discipline = DisciplineTeacherModel.fromJson(item);
      disciplineTeacher.add(discipline);
    }
    notifyListeners();
  }

  Future insertScoreToStudentProvider(data) async {
    var request = await insertScoreToStudent(data);

    if (request.containsKey('success')) {
      return Fluttertoast.showToast(
          msg: request["success"].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    if (request.containsKey('error')) {
      return Fluttertoast.showToast(
          msg: request["error"].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    notifyListeners();
  }

  Future getScoreRepository() async {
    studentScore.clear();
    scores.clear();
    disciplineTeacherStudentsScore.clear();

    await getDisciplineByTeacherList();
    var response = await getScoreApi();

    for (var item in response) {
      var itemFromJson = ScoreModel.fromJson(item);
      scores.add(itemFromJson);
    }
    var disciplineTeacherStudentsScore2 = disciplineTeacher.fold<List<dynamic>>(
      [],
      (previousValue, item) {
        item.student.forEach((itemSecundario) {
          var itemFromJson = itemSecundario;
          previousValue.add(itemFromJson);
        });
        return previousValue;
      },
    );

    for (var item in disciplineTeacherStudentsScore2) {
      Map<String, dynamic> map1 = Teacher(
              id: item.id, name: item.name, phone: item.phone, user: item.user)
          .toJson();
      var scoreValues = scores.firstWhere((score) => score.aluno.id == item.id,
          orElse: () => null);

      if (scoreValues == null) {
        map1["score"] = {};
      }
      if (scoreValues != null) {
        map1["score"] = {
          "id": scoreValues.id,
          "phone": scoreValues.aluno.phone,
          "user": scoreValues.aluno.user,
          "score": scoreValues.score
        };
      }
      studentScore.add(map1);
    }
    print(studentScore.length);
    notifyListeners();
  }
}
