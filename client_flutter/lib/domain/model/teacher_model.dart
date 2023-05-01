class Teacher {
  Teacher({
    required this.id,
    this.name,
    required this.phone,
    required this.user,
  });

  int id;
  String? name;
  String phone;
  int user;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"],
        name: json["name"],
        phone: json["phone"] ?? "",
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "user": user,
      };
}
