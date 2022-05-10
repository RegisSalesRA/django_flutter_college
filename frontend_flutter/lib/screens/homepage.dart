import 'package:flutter/material.dart';
import 'package:frontend_flutter/api/api_form.dart';

import 'package:provider/provider.dart';

import '../model/model_cadastro.dart';
import 'formCrud/cadastrar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _init = true;


  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<CadastroProvider>(context).getCadastro();
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    final cadastros = Provider.of<CadastroProvider>(context).cadastroList;
    print(cadastros);
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => CadastrarForm()));
            }),
        body: Container(
            child: ListView.builder(
                itemCount: cadastros.length,
                itemBuilder: (BuildContext context, index) {
                  return Text(cadastros[index].nome);
                })));
  }
}
