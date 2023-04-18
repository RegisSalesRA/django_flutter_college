class StudentModel {
  StudentModel({
    required this.username,
    required this.password,
    required this.password2,
    required this.phone,
    required this.name,
  });

  String username;
  String password;
  String password2;
  String phone;
  String name;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        username: json["username"],
        password: json["password"],
        password2: json["password2"],
        phone: json["phone"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "password2": password2,
        "phone": phone,
        "name": name,
      };
}
