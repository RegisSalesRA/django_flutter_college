class StudentModel {
  int id;
  String user;
  bool isStudent;
  bool isTeacher;
  int idStudent;
  String name;
  String phone;

  StudentModel({
    required this.id,
    required this.user,
    required this.isStudent,
    required this.isTeacher,
    required this.idStudent,
    required this.name,
    required this.phone,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json["id"],
        user: json["user"] ?? "",
        isStudent: json["is_student"] ?? true,
        isTeacher: json["is_teacher"] ?? false,
        idStudent: json["id_student"] ?? 1,
        name: json["name"] ?? "",
        phone: json["phone"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "is_student": isStudent,
        "is_teacher": isTeacher,
        "id_student": idStudent,
        "name": name,
        "phone": phone,
      };
}
