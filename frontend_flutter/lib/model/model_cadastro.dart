class CadastroForm {
  int id;
  String image;
  String nome;
  String school;
  bool isCompleted;

  CadastroForm({this.id, this.image, this.nome, this.school, this.isCompleted});

  CadastroForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    nome = json['nome'];
    school = json['school'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['nome'] = this.nome;
    data['school'] = this.school;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}
