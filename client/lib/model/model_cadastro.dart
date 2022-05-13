class CadastroForm {
  int? id;
  late String nome;
  late String dev;
  late bool isCompleted;

  CadastroForm(
      {this.id,
      required this.nome,
      required this.dev,
      required this.isCompleted});

  CadastroForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    dev = json['dev'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['dev'] = this.dev;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}
