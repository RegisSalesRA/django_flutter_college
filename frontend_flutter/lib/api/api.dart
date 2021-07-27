import 'package:flutter/material.dart';
import 'package:frontend_flutter/config/api_adress.dart';
import 'dart:convert';
import '../model/model_todo.dart';
import 'package:http/http.dart' as http;

class ToDoProvider with ChangeNotifier {
  List<ToDo> _toDoList = [];

  List<ToDo> get toDoList {
    return [..._toDoList];
  }

  void addToDo(ToDo toDoList) async {
    final response = await http.post('$baseUrl:8000/api/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(toDoList));
    if (response.statusCode == 201) {
      toDoList.id = json.decode(response.body)['id'];
      _toDoList.add(toDoList);
      notifyListeners();
    }
  }

  void deleteToDo(ToDo toDoList) async {
    final response = await http.delete('$baseUrl:8000/api/${toDoList.id}/');
    if (response.statusCode == 204) {
      _toDoList.remove(toDoList);
      notifyListeners();
    }
  }
}
