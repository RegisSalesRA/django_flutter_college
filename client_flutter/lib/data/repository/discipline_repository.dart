import '../../app/helpers/toeast_helper.dart';
import '../data.dart';

class DisciplineRepository {
  static Future<void> disciplineChosedByStudentRepository(data) async {
    var request = await disciplineChosedByStudent(data);
    if (request.containsKey('success')) {
      toastHelper(request["success"].toString(), false);
    }
    if (request.containsKey('error')) {
      toastHelper(request["error"].toString(), true);
    }
  }

  static Future insertScoreToStudentRepository(data) async {
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
  }

  static Future getDisciplineByStudentAvailibleListRepository(
      disciplineStudentAvailible) async {
    disciplineStudentAvailible.clear();
    var request = await getDisciplineAvailibleByStudent();
    for (var item in request) {
      var discipline = DisciplineModel.fromJson(item);
      disciplineStudentAvailible.add(discipline);
    }
  }

  static Future getScoreDisciplineByStudentListRepository(
      scoreDisciplineStudentAvailible) async {
    scoreDisciplineStudentAvailible.clear();
    var request = await getScoreDisciplineByStudent();
    for (var item in request) {
      var discipline = ScoreModel.fromJson(item);
      scoreDisciplineStudentAvailible.add(discipline);
    }
  }

  static Future getDisciplineByStudentListRepository(disciplineStudent) async {
    var request = await getDisciplineByStudent();
    for (var item in request) {
      var discipline = DisciplineModel.fromJson(item);
      disciplineStudent.add(discipline);
    }
  }

  static Future getDisciplineByTeacherRepository(disciplineTeacher) async {
    var request = await getDisciplineByTeacher();
    for (var item in request) {
      var discipline = DisciplineModel.fromJson(item);
      disciplineTeacher.add(discipline);
    }
  }

  static Future getScoreRepository(
      idDiscipline, scores, disciplineTeacher, studentScore) async {
    await getDisciplineByTeacherRepository(disciplineTeacher);
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
  }
}
