import 'package:flutter/material.dart';
import 'package:client/api/api_form.dart';

import 'package:provider/provider.dart';

import '../model/model_cadastro.dart';
import 'formCrud/cadastrar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _init = true;

  bool? _isLoading = true;
  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<CadastroProvider>(context).getCadastro();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final dev = Provider.of<CadastroProvider>(context).cadastroList;

    return Scaffold(
        appBar: AppBar(
          title: Text("Home Django Flutter"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => CadastrarForm()));
            }),
        body: Container(
            child: ListView.builder(
                itemCount: dev.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(title: Text(dev[index].nome));
                })));
  }
}
