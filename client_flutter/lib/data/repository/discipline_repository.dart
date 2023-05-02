import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../domain/domain.dart';
import '../data/get_discipline.dart';

class DisciplineRepository with ChangeNotifier {
  static final DisciplineRepository _instance = DisciplineRepository._();

  factory DisciplineRepository() => _instance;

  DisciplineRepository._();

  List disciplineTeacher = [];
  List disciplineStudentAvailible = [];
  List disciplineStudent = [];
  List scores = [];
  List disciplineTeacherStudentsScore = [];
  List studentScore = [];

  final scoreController = TextEditingController();

  void cleanFidelds() {
    scoreController.clear();
  }

  Future getDisciplineByTeacherList() async {
    disciplineTeacher.clear();
    var request = await getDisciplineByTeacher();
    for (var item in request) {
      var discipline = DisciplineTeacherModel.fromJson(item);
      disciplineTeacher.add(discipline);
    }
    notifyListeners();
  }

  Future getDisciplineByStudentList() async {
    disciplineStudent.clear();
    var request = await getDisciplineByStudent();
    for (var item in request) {
      var discipline = DisciplineTeacherModel.fromJson(item);
      disciplineStudent.add(discipline);
    }
    notifyListeners();
  }

  Future getDisciplineByStudentAvailibleList() async {
    disciplineStudentAvailible.clear();
    print("Lista primeira $disciplineStudentAvailible");
    var request = await getDisciplineAvailibleByStudent();
    for (var item in request) {
      var discipline = DisciplineTeacherModel.fromJson(item);
      disciplineStudentAvailible.add(discipline);
    }
    print("Lista final $disciplineStudentAvailible");
    notifyListeners();
  }

  Future insertScoreToStudentProvider(data) async {
    var request = await insertScoreToStudent(data);
    await getDisciplineByStudentAvailibleList();
    notifyListeners();
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

  Future disciplineChosedByStudentRepository(data) async {
    var request = await disciplineChosedByStudent(data);
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
  }

  Future getScoreRepository(idDiscipline) async {
    studentScore.clear();
    scores.clear();
    disciplineTeacherStudentsScore.clear();

    await getDisciplineByTeacherList();
    var response = await getScoreApi();

    for (var item in response) {
      var itemFromJson = ScoreModel.fromJson(item);
      scores.add(itemFromJson);
    }

    var filterDiciplineById = disciplineTeacher
        .where((element) => element.id == idDiscipline)
        .toList();

    var disciplineTeacherStudentsScore2 =
        filterDiciplineById.fold<List<dynamic>>(
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
      var scoreValues = scores.firstWhere(
          (score) =>
              score.aluno.id == item.id && score.discipline.id == idDiscipline,
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
    notifyListeners();
  }
}
