import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend_flutter/api/api_form.dart';
import 'package:frontend_flutter/model/model_cadastro.dart';
import 'package:provider/provider.dart';

class CadastrarForm extends StatefulWidget {
  @override
  _CadastrarFormState createState() => _CadastrarFormState();
}

class _CadastrarFormState extends State<CadastrarForm> {
  final _formKeyCadastro = GlobalKey<FormState>();
  String nome;
  String school;
  bool isCompleted = false;

  void adicionar() {
    if (_formKeyCadastro.currentState.validate()) {
      final CadastroForm cadastroForm =
          CadastroForm(nome: nome, school: school, isCompleted: isCompleted);
      print(nome);
      Provider.of<CadastroProvider>(context, listen: false)
          .createCase(cadastroForm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Cadastro"),
        ),
        body: Form(
          key: _formKeyCadastro,
          child: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (v) {
                      if (v.isEmpty) {
                        return "Por favor preencher os dados";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Title'),
                    onChanged: (value) {
                      setState(() {
                        nome = value;
                      });
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: school == null
                              ? Text(
                                  'Selecione a opção',
                                  style: TextStyle(fontSize: 20),
                                )
                              : Text(
                                  school,
                                  style: TextStyle(color: Colors.blue),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          items: ['Masculino', 'Feminino'].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                school = val;
                              },
                            );
                          },
                        ),
                      )),
                  Divider(),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Checkbox(
                      value: isCompleted,
                      activeColor: Colors.orange,
                      onChanged: (bool valor) {
                        setState(() {
                          isCompleted = valor;
                        });
                        print("Checkbox: " + valor.toString());
                      },
                    ),
                    Text(
                      'is completed?',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        adicionar();
                        print('Adicionado');
                        Navigator.of(context).pop();
                      },
                      child: Text('Submit Data')),
                ],
              ),
            ),
          ),
        ));
  }
}
