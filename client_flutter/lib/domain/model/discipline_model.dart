import '../domain.dart';

class DisciplineModel {
  DisciplineModel({
    required this.id,
    required this.updateAt,
    required this.createAt,
    required this.name,
    required this.ano,
    required this.teacher,
    required this.semester,
    required this.student,
  });

  int id;
  DateTime updateAt;
  DateTime createAt;
  String name;
  String ano;
  TeacherModel teacher;
  SemesterModel semester;
  List<StudentModel> student;

  factory DisciplineModel.fromJson(Map<String, dynamic> json) =>
      DisciplineModel(
        id: json["id"],
        updateAt: DateTime.parse(json["updateAt"]),
        createAt: DateTime.parse(json["createAt"]),
        name: json["name"],
        ano: json["ano"],
        teacher: TeacherModel.fromJson(json["teacher"]),
        semester: SemesterModel.fromJson(json["semester"]),
        student: List<StudentModel>.from(
            json["student"].map((x) => StudentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updateAt": updateAt.toIso8601String(),
        "createAt": createAt.toIso8601String(),
        "name": name,
        "ano": ano,
        "teacher": teacher.toJson(),
        "semester": semester.toJson(),
        "student": List<dynamic>.from(student.map((x) => x.toJson())),
      };
}
