import 'package:flutter/material.dart';
import 'package:client/api/api_form.dart';

import 'package:provider/provider.dart';

import '../model/model_cadastro.dart';
import 'formCrud/cadastrar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _init = true;
  final cadastro_ = CadastroProvider();

  /*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CadastroProvider>(context, listen: true).getCadastro();
  }
*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cadastro_.getCadastro();
    cadastro_.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Django Flutter"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => CadastrarForm()));
            }
            
            ),
        body: Container(
            child: ListView.builder(
                itemCount: cadastro_.cadastroList.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                      title: Text(cadastro_.cadastroList[index].nome));
                })));
  }
}
