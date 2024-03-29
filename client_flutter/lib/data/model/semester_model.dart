class SemesterModel {
    SemesterModel({
        required this.id,
        required this.updateAt,
        required this.createAt,
        required this.semester,
    });

    int id;
    DateTime updateAt;
    DateTime createAt;
    String semester;

    factory SemesterModel.fromJson(Map<String, dynamic> json) => SemesterModel(
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
