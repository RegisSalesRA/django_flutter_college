import 'package:flutter/material.dart';
import '../../app/helpers/toeast_helper.dart';
import '../data.dart';

class DisciplineRepository with ChangeNotifier {
  static final DisciplineRepository _instance = DisciplineRepository._();

  factory DisciplineRepository() => _instance;

  DisciplineRepository._();

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<String> valueFieldText = ValueNotifier<String>("");

  List disciplineTeacher = [];
  List disciplineStudentAvailible = [];
  List scoreDisciplineStudentAvailible = [];
  List disciplineStudent = [];
  List scores = [];
  List disciplineTeacherStudentsScore = [];
  List studentScore = [];

  final scoreController = TextEditingController();

  void cleanFidelds() {
    scoreController.clear();
    valueFieldText.value = "";
  }

  Future getDisciplineByTeacherRepository() async {
    isLoading.value = true;
    disciplineTeacher.clear();
    var request = await getDisciplineByTeacher();
    for (var item in request) {
      var discipline = DisciplineModel.fromJson(item);
      disciplineTeacher.add(discipline);
    }
    isLoading.value = false;
    cleanFidelds();
    notifyListeners();
  }

  Future getDisciplineByStudentListRepository() async {
    isLoading.value = true;
    disciplineStudent.clear();
    var request = await getDisciplineByStudent();
    for (var item in request) {
      var discipline = DisciplineModel.fromJson(item);
      disciplineStudent.add(discipline);
    }
    cleanFidelds();
    isLoading.value = false;
    notifyListeners();
  }

  Future getScoreDisciplineByStudentListRepository() async {
    isLoading.value = true;
    scoreDisciplineStudentAvailible.clear();
    var request = await getScoreDisciplineByStudent();
    for (var item in request) {
      var discipline = ScoreModel.fromJson(item);
      scoreDisciplineStudentAvailible.add(discipline);
    }
    cleanFidelds();
    isLoading.value = false;
    notifyListeners();
  }

  Future getDisciplineByStudentAvailibleListRepository() async {
    isLoading.value = true;
    disciplineStudentAvailible.clear();
    var request = await getDisciplineAvailibleByStudent();
    for (var item in request) {
      var discipline = DisciplineModel.fromJson(item);
      disciplineStudentAvailible.add(discipline);
    }
    cleanFidelds();
    isLoading.value = false;
    notifyListeners();
  }

  Future insertScoreToStudentRepository(data) async {
    isLoading.value = true;
    var request = await insertScoreToStudent(data);
    if (request.containsKey('success')) {
      return toastHelper(
        request["success"].toString(),
        false,
      );
    }
    if (request.containsKey('error')) {
      return toastHelper(request["error"].toString(), true);
    }
    isLoading.value = false;
    cleanFidelds();
    notifyListeners();
  }

  Future<void> disciplineChosedByStudentRepository(data) async {
    isLoading.value = true;
    var request = await disciplineChosedByStudent(data);
    if (request.containsKey('success')) {
      toastHelper(request["success"].toString(), false);
    }
    if (request.containsKey('error')) {
      toastHelper(request["error"].toString(), true);
    }
    cleanFidelds();
    isLoading.value = false;
  }

  Future getScoreRepository(idDiscipline) async {
    isLoading.value = true;
    studentScore.clear();
    scores.clear();
    disciplineTeacherStudentsScore.clear();

    await getDisciplineByTeacherRepository();
    var response = await getScoreApi();

    for (var item in response) {
      var itemFromJson = ScoreModelSmall.fromJson(item);
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
      Map<String, dynamic> map1 = TeacherModel(
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
    cleanFidelds();
    isLoading.value = false;
    notifyListeners();
  }
}
