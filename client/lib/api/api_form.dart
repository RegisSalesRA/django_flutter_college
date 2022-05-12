import 'package:flutter/material.dart';
import 'package:client/config/api_adress.dart';
import 'package:client/model/model_cadastro.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CadastroProvider extends ChangeNotifier {
  List<CadastroForm> _cadastroList = [];

  Future<bool?> getCadastro() async {
    try {
      http.Response response =
          await http.get(Uri.parse('$baseUrl:8000/api/v1/cadastro/'), headers: {
        'Content-Type': 'application/json;charset=UTF-8',
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        List<CadastroForm> temp = [];
        data.forEach((element) {
          CadastroForm cadastro = CadastroForm.fromJson(element);
          temp.add(cadastro);
        });
        _cadastroList = temp;
        notifyListeners();
        print(_cadastroList);
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  void cadastrarForm(CadastroForm cadastroForm) async {
    final response = await http.post(
        Uri.parse('$baseUrl:8000/api/v1/cadastro/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(cadastroForm));
    if (response.statusCode == 201) {
      cadastroForm.id = json.decode(response.body)['id'];
      _cadastroList.add(cadastroForm);
    }
  }

  List<CadastroForm> get cadastroList {
    return [..._cadastroList];
  }
}
