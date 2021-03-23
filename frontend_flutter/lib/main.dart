import 'package:flutter/material.dart';
import 'package:frontend_flutter/model/model.dart';
import 'package:frontend_flutter/screens/addToDo.dart';
import 'package:provider/provider.dart';

import 'api/api.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final toDoP = Provider.of<ToDoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("To do App"),
      ),
      body: ListView.builder(
        itemCount: toDoP.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                toDoP.deleteToDo(toDoP.toDoList[index]);
              },
            ),
            title: Text(
              toDoP.toDoList[index].title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(toDoP.toDoList[index].description,
                style: TextStyle(fontSize: 15, color: Colors.black)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => AddTodoScreen()));
          }),
    );
  }
}
