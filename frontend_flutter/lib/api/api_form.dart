import 'package:flutter/material.dart';
import 'package:frontend_flutter/config/api_adress.dart';
import 'package:frontend_flutter/model/model_cadastro.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CadastroProvider with ChangeNotifier {
  List<CadastroForm> _cadastroList = [];

  Future<bool> getCadastro() async {
    String url = '$baseUrl:8000/api/v1/';

    try {
      http.Response response = await http.get(url, headers: {
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
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // void addToDo(CadastroForm toDoList) async {
  //   final response = await http.post('$baseUrl:8000/api/',
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode(toDoList));
  //   if (response.statusCode == 201) {
  //     toDoList.id = json.decode(response.body)['id'];
  //     _toDoList.add(toDoList);
  //     notifyListeners();
  //   }
  // }

  // void deleteToDo(CadastroForm toDoList) async {
  //   final response = await http.delete('$baseUrl:8000/api/${toDoList.id}/');
  //   if (response.statusCode == 204) {
  //     _toDoList.remove(toDoList);
  //     notifyListeners();
  //   }
  // }

  List<CadastroForm> get cadastroList {
    return [..._cadastroList];
  }
}
