class CadastroForm {
  int id;
  String nome;
  String school;
  bool isCompleted;

  CadastroForm({this.id, this.nome, this.school, this.isCompleted});

  CadastroForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    school = json['school'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['school'] = this.school;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}
