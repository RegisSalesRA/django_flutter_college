import 'package:client_flutter/domain/model/semester_model.dart';
import 'package:client_flutter/domain/model/teacher_model.dart';

class DisciplineTeacherModel {
  DisciplineTeacherModel({
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
  Teacher teacher;
  Semester semester;
  List<Teacher> student;

  factory DisciplineTeacherModel.fromJson(Map<String, dynamic> json) =>
      DisciplineTeacherModel(
        id: json["id"],
        updateAt: DateTime.parse(json["updateAt"]),
        createAt: DateTime.parse(json["createAt"]),
        name: json["name"],
        ano: json["ano"],
        teacher: Teacher.fromJson(json["teacher"]),
        semester: Semester.fromJson(json["semester"]),
        student:
            List<Teacher>.from(json["student"].map((x) => Teacher.fromJson(x))),
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
