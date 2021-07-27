class FastCadastro {
  int id;
  String nome;
  String sobrenome;

  FastCadastro({this.id, this.nome, this.sobrenome});

  FastCadastro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    sobrenome = json['sobrenome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['sobrenome'] = this.sobrenome;
    return data;
  }
}
