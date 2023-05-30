import 'package:flutter/material.dart';
import '../repository/repository.dart';

class DisciplineController with ChangeNotifier {
  static final DisciplineController _instance = DisciplineController._();

  factory DisciplineController() => _instance;

  DisciplineController._();

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

  getDisciplineByTeacherController() async {
    isLoading.value = true;
    disciplineTeacher.clear();
    await DisciplineRepository.getDisciplineByTeacherRepository(
        disciplineTeacher);
    notifyListeners();
    isLoading.value = false;
  }

  getDisciplineByStudentListController() async {
    isLoading.value = true;
    disciplineStudent.clear();
    await DisciplineRepository.getDisciplineByStudentListRepository(
        disciplineStudent);
    isLoading.value = false;
    cleanFidelds();
    notifyListeners();
  }

  getScoreDisciplineByStudentListController() async {
    isLoading.value = true;
    await DisciplineRepository.getScoreDisciplineByStudentListRepository(
        scoreDisciplineStudentAvailible);
    isLoading.value = false;

    notifyListeners();
  }

  getDisciplineByStudentAvailibleListController() async {
    isLoading.value = true;
    await DisciplineRepository.getDisciplineByStudentAvailibleListRepository(
        disciplineStudentAvailible);
    print(disciplineStudentAvailible);
    notifyListeners();
    isLoading.value = false;
  }

  insertScoreToStudentController(data) {
    isLoading.value = true;
    DisciplineRepository.insertScoreToStudentRepository(data);
    isLoading.value = false;
    notifyListeners();
  }

  disciplineChosedByStudentController(data) {
    isLoading.value = true;
    DisciplineRepository.disciplineChosedByStudentRepository(data);
    isLoading.value = false;
    notifyListeners();
  }

  getScoreController(idDiscipline) async {
    isLoading.value = true;
    disciplineTeacher.clear();
    studentScore.clear();
    scores.clear();

    await DisciplineRepository.getScoreRepository(
        idDiscipline, scores, disciplineTeacher, studentScore);
    isLoading.value = false;
    notifyListeners();
  }
}
