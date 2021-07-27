import 'package:flutter/material.dart';
import 'package:frontend_flutter/api/api.dart';
import 'package:frontend_flutter/model/model.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final toDoTitleController = TextEditingController();
  final toDoDescriptionController = TextEditingController();

  void onAdd() {
    final String textVal = toDoTitleController.text;
    final String descriptionVal = toDoDescriptionController.text;

    if (textVal.isNotEmpty && descriptionVal.isNotEmpty) {
      final ToDo todo = ToDo(title: textVal, description: descriptionVal);
      Provider.of<ToDoProvider>(context, listen: false).addToDo(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Adicione uma tarefa"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Icon(
                  Icons.featured_play_list_outlined,
                  size: 110.0,
                  color: Colors.red,
                ),
                TextField(
                  style: TextStyle(color: Colors.red, fontSize: 20),
                  controller: toDoTitleController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red),
                      labelText: "Digite a sua tarefa"),
                ),
                TextField(
                  style: TextStyle(color: Colors.red, fontSize: 20),
                  controller: toDoDescriptionController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red),
                      labelText: "Digite a sua tarefa"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                      color: Colors.red,
                      child: Text("Confirmar",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        onAdd();
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
