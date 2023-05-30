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

  getDisciplineByTeacherController() {
    isLoading.value = true;
    DisciplineRepository.getDisciplineByTeacherRepository(disciplineTeacher);
    disciplineTeacher.clear();
    isLoading.value = false;
    notifyListeners();
  }

  getDisciplineByStudentListController() {
    isLoading.value = true;
    DisciplineRepository.getDisciplineByStudentListRepository(
        disciplineStudent);
    isLoading.value = false;
    cleanFidelds();
    notifyListeners();
  }

  getScoreDisciplineByStudentListController() {
    isLoading.value = true;
    DisciplineRepository.getScoreDisciplineByStudentListRepository(
        scoreDisciplineStudentAvailible);
    isLoading.value = false;

    notifyListeners();
  }

  getDisciplineByStudentAvailibleListController() {
    isLoading.value = true;
    DisciplineRepository.getDisciplineByStudentAvailibleListRepository(
        disciplineStudentAvailible);
    isLoading.value = false;
    notifyListeners();
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

  getScoreController(idDiscipline) {
    isLoading.value = true;
    DisciplineRepository.getScoreRepository(
        idDiscipline, scores, disciplineTeacher, studentScore);
    isLoading.value = false;
    notifyListeners();
  }
}