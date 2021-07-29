import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend_flutter/api/api_fast_form.dart';
import 'package:frontend_flutter/model/model_fast_cadastro.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class CadastrarFormFast extends StatefulWidget {
  @override
  _CadastrarFormFastState createState() => _CadastrarFormFastState();
}

class _CadastrarFormFastState extends State<CadastrarFormFast> {
  final _formKeyCadastro = GlobalKey<FormState>();
  String nome;
  String sobrenome;
  String school;
  bool isCompleted = false;
  File _image;
  String _imagepath;
  final picker = ImagePicker();

  Future<void> chooseImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    final data = DateTime.now().millisecondsSinceEpoch.toString();
    //set source: ImageSource.camera to get image from camera
    Directory appDocDir = await getApplicationDocumentsDirectory();
    print('Directory é: ${appDocDir}');
    String bgPath = appDocDir.uri.resolve(data.toString()).path;
    print('Path é: ${bgPath}');
    // ignore: unused_local_variable
    File bgFile = await image.copy(bgPath);

    setState(() {
      _image = image;
      _imagepath = bgPath;
    });
  }

  void saveImage(path) async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagepath", path);
  }

  void loadImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      _imagepath = saveimage.getString("imagepath");
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    loadImage();
  }

  void adicionar() {
    if (_formKeyCadastro.currentState.validate()) {
      final FastCadastro cadastroForm = FastCadastro(
          nome: nome,
          sobrenome: sobrenome,
          isCompleted: isCompleted,
          image: _imagepath.toString());
      print(_imagepath);
      Provider.of<CadastroFastProvider>(context, listen: false)
          .cadastrarFastForm(cadastroForm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Cadastro FAST"),
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
                    decoration: InputDecoration(hintText: 'nome'),
                    onChanged: (value) {
                      setState(() {
                        nome = value;
                      });
                    },
                  ),
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
                    decoration: InputDecoration(hintText: 'sobrenome'),
                    onChanged: (value) {
                      setState(() {
                        sobrenome = value;
                      });
                    },
                  ),
/*
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

                      */
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
                    height: 25,
                  ),
                  Container(
                      //show upload button after choosing image
                      child: _image != null
                          ? InkWell(
                              onTap: () {
                                chooseImage();
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                ),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  child: Image.file(_image),
                                ),
                              ))
                          : //if uploadimage is null then show empty container
                          Container(
                              //elese show uplaod button
                              // ignore: deprecated_member_use
                              child: RaisedButton.icon(
                              onPressed: () {
                                chooseImage();
                                //start uploading image
                              },
                              icon: Icon(Icons.file_upload),
                              label: Text("UPLOAD IMAGE"),
                              color: Colors.red,
                              colorBrightness: Brightness.dark,
                              //set brghtness to dark, because deepOrangeAccent is darker coler
                              //so that its text color is light
                            ))),
                  SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //   adicionar();
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