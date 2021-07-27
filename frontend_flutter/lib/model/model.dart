class ToDo {
  int id;
  final String title;
  final String description;

  ToDo({this.id, this.title, this.description});

  factory ToDo.fromjson(Map<String, dynamic> json) {
    return ToDo(
        id: json['id'], title: json['title'], description: json['description']);
  }
  dynamic toJson() => {'id': id, 'title': title, 'description': description};
}
