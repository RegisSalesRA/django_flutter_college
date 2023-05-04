class ScoreModel2 {
  ScoreModel2({
    required this.id,
    required this.updateAt,
    required this.createAt,
    required this.score,
    required this.aluno,
    required this.discipline,
  });

  int id;
  DateTime updateAt;
  DateTime createAt;
  String score;
  Aluno aluno;
  Discipline2 discipline;

  factory ScoreModel2.fromJson(Map<String, dynamic> json) => ScoreModel2(
        id: json["id"],
        updateAt: DateTime.parse(json["updateAt"]),
        createAt: DateTime.parse(json["createAt"]),
        score: json["score"],
        aluno: Aluno.fromJson(json["student"]),
        discipline: Discipline2.fromJson(json["discipline"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updateAt": updateAt.toIso8601String(),
        "createAt": createAt.toIso8601String(),
        "score": score,
        "aluno": aluno.toJson(),
        "discipline": discipline.toJson(),
      };
}

class Aluno {
  Aluno({
    required this.id,
    required this.name,
    required this.phone,
    required this.user,
  });

  int id;
  String name;
  String phone;
  int user;

  factory Aluno.fromJson(Map<String, dynamic> json) => Aluno(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "user": user,
      };
}

class Discipline2 {
  Discipline2({
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
  int teacher;
  int semester;
  List<int> student;

  factory Discipline2.fromJson(Map<String, dynamic> json) => Discipline2(
        id: json["id"],
        updateAt: DateTime.parse(json["updateAt"]),
        createAt: DateTime.parse(json["createAt"]),
        name: json["name"],
        ano: json["ano"],
        teacher: json["teacher"],
        semester: json["semester"],
        student: List<int>.from(json["student"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updateAt": updateAt.toIso8601String(),
        "createAt": createAt.toIso8601String(),
        "name": name,
        "ano": ano,
        "teacher": teacher,
        "semester": semester,
        "student": List<dynamic>.from(student.map((x) => x)),
      };
}
