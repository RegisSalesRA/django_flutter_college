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
        title: Text("ADD to do"),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                TextField(
                  controller: toDoTitleController,
                ),
                TextField(
                  controller: toDoDescriptionController,
                ),
                RaisedButton(
                    child: Text("Add"),
                    onPressed: () {
                      onAdd();
                      Navigator.of(context).pop();
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
