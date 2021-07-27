import 'package:flutter/material.dart';
import 'package:frontend_flutter/config/api_adress.dart';
import 'package:frontend_flutter/model/model_cadastro.dart';
import 'package:frontend_flutter/model/model_fast_cadastro.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CadastroProvider with ChangeNotifier {
  List<FastCadastro> _cadastrofastList = [];

  Future<bool> getfastCadastro() async {
    String url = '$baseUrl:8000/api/v1/';

    try {
      http.Response response = await http.get(url, headers: {
        'Content-Type': 'application/json;charset=UTF-8',
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        List<FastCadastro> temp = [];
        data.forEach((element) {
          FastCadastro cadastro = FastCadastro.fromJson(element);
          temp.add(cadastro);
        });
        _cadastrofastList = temp;
        notifyListeners();
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void cadastrarForm(FastCadastro cadastroForm) async {
    final response = await http.post('$baseUrl:8000/api/v1/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(cadastroForm));
    if (response.statusCode == 200) {
      cadastroForm.id = json.decode(response.body)['id'];
      print(cadastroForm);
      _cadastrofastList.add(cadastroForm);
      notifyListeners();
    }
  }

  Future<CadastroForm> createCase(FastCadastro cadastroForm) async {
    String url = '$baseUrl:8000/api/v1/';

    Map data = {
      'nome': cadastroForm.nome,
      'sobrenome': cadastroForm.sobrenome,
    };
    http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(data));

    if (response.statusCode == 201) {
      return CadastroForm.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  // void deleteToDo(CadastroForm toDoList) async {
  //   final response = await http.delete('$baseUrl:8000/api/${toDoList.id}/');
  //   if (response.statusCode == 204) {
  //     _toDoList.remove(toDoList);
  //     notifyListeners();
  //   }
  // }

  List<FastCadastro> get cadastroList {
    return [..._cadastrofastList];
  }
}
