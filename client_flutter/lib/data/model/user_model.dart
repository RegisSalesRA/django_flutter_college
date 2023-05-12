class UserModel {
  UserModel({
    required this.id,
    required this.user,
    required this.isStudent,
    required this.isTeacher,
    required this.idStudent,
    required this.idTeacher,
    required this.name,
    required this.phone,
  });

  int id;
  String user;
  bool isStudent;
  bool isTeacher;
  int idStudent;
  int idTeacher;
  String name;
  String phone;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        user: json["user"],
        isStudent: json["is_student"],
        isTeacher: json["is_teacher"],
        idStudent: json["id_student"] ?? 0,
        idTeacher: json["id_teacher"] ?? 0,
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "is_student": isStudent,
        "is_teacher": isTeacher,
        "id_student": idStudent,
        "id_teacher": idTeacher,
        "name": name,
        "phone": phone,
      };
}
