import 'package:flutter/material.dart';
import 'package:client/api/api_form.dart';
import 'package:client/model/model_cadastro.dart';
import 'package:provider/provider.dart';

import '../home.dart';

class CadastrarForm extends StatefulWidget {
  @override
  _CadastrarFormState createState() => _CadastrarFormState();
}

class _CadastrarFormState extends State<CadastrarForm> {
  final _formKeyCadastro = GlobalKey<FormState>();
  String? nome;
  String? school;
  bool isCompleted = false;

  void adicionar() {
    if (_formKeyCadastro.currentState!.validate()) {
      final CadastroForm cadastroForm =
          CadastroForm(nome: nome!, school: school!, isCompleted: isCompleted);
      Provider.of<CadastroProvider>(context, listen: false)
          .cadastrarForm(cadastroForm);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cadastro"),
        ),
        body: Form(
          key: _formKeyCadastro,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Por favor preencher os dados";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: 'Title'),
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
                                  school.toString(),
                                  style: TextStyle(color: Colors.blue),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                          items: ['Junior', 'Pleno', 'Senior'].map(
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
                                school = val.toString();
                              },
                            );
                          },
                        ),
                      )),
                  const Divider(),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Checkbox(
                      value: isCompleted,
                      activeColor: Colors.orange,
                      onChanged: (valor) {
                        setState(() {
                          isCompleted = valor!;
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
                  const SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        adicionar();
                      },
                      child: Text('Accept Dev')),
                ],
              ),
            ),
          ),
        ));
  }
}
