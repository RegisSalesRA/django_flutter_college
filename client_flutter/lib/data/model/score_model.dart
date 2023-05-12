class ScoreModel {
  int id;
  DateTime updateAt;
  DateTime createAt;
  String score;
  Student student;
  Discipline discipline;

  ScoreModel({
    required this.id,
    required this.updateAt,
    required this.createAt,
    required this.score,
    required this.student,
    required this.discipline,
  });

  factory ScoreModel.fromJson(Map<String, dynamic> json) => ScoreModel(
        id: json["id"],
        updateAt: DateTime.parse(json["updateAt"]),
        createAt: DateTime.parse(json["createAt"]),
        score: json["score"],
        student: Student.fromJson(json["student"]),
        discipline: Discipline.fromJson(json["discipline"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updateAt": updateAt.toIso8601String(),
        "createAt": createAt.toIso8601String(),
        "score": score,
        "student": student.toJson(),
        "discipline": discipline.toJson(),
      };
}

class Discipline {
  int id;
  DateTime updateAt;
  DateTime createAt;
  String name;
  String ano;
  Teacher teacher;
  Semester semester;
  List<Teacher> student;

  Discipline({
    required this.id,
    required this.updateAt,
    required this.createAt,
    required this.name,
    required this.ano,
    required this.teacher,
    required this.semester,
    required this.student,
  });

  factory Discipline.fromJson(Map<String, dynamic> json) => Discipline(
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

class Semester {
  int id;
  DateTime updateAt;
  DateTime createAt;
  String semester;

  Semester({
    required this.id,
    required this.updateAt,
    required this.createAt,
    required this.semester,
  });

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        id: json["id"],
        updateAt: DateTime.parse(json["updateAt"]),
        createAt: DateTime.parse(json["createAt"]),
        semester: json["semester"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updateAt": updateAt.toIso8601String(),
        "createAt": createAt.toIso8601String(),
        "semester": semester,
      };
}

class Teacher {
  int id;
  String name;
  String? phone;
  int user;

  Teacher({
    required this.id,
    required this.name,
    this.phone,
    required this.user,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
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

class Student {
  int id;
  String name;
  String phone;
  User user;

  Student({
    required this.id,
    required this.name,
    required this.phone,
    required this.user,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "user": user.toJson(),
      };
}

class User {
  int id;
  DateTime updateAt;
  DateTime createAt;
  String password;
  dynamic lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;
  bool isTeacher;
  bool isStudent;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  User({
    required this.id,
    required this.updateAt,
    required this.createAt,
    required this.password,
    this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.isTeacher,
    required this.isStudent,
    required this.groups,
    required this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updateAt: DateTime.parse(json["updateAt"]),
        createAt: DateTime.parse(json["createAt"]),
        password: json["password"],
        lastLogin: json["last_login"],
        isSuperuser: json["is_superuser"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        isTeacher: json["is_teacher"],
        isStudent: json["is_student"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updateAt": updateAt.toIso8601String(),
        "createAt": createAt.toIso8601String(),
        "password": password,
        "last_login": lastLogin,
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "is_teacher": isTeacher,
        "is_student": isStudent,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}
