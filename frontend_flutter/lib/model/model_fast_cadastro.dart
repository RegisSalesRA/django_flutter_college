import 'dart:io';

class FastCadastro {
  int id;
  String nome;
  String sobrenome;
  bool isCompleted;
  String image;

  FastCadastro(
      {this.id, this.nome, this.sobrenome, this.isCompleted, this.image});

  FastCadastro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    sobrenome = json['sobrenome'];
    isCompleted = json['isCompleted'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['sobrenome'] = this.sobrenome;
    data['isCompleted'] = this.isCompleted;
    data['image'] = this.image;
    return data;
  }
}
