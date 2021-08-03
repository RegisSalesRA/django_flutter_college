import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend_flutter/api/api_fast_form.dart';
import 'package:frontend_flutter/model/model_fast_cadastro.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
  File imageSelected;
  String imageData;
  final picker = ImagePicker();

  Future chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        imageSelected = File(pickedFile.path);
        print(imageSelected);
        imageData = base64Encode(imageSelected.readAsBytesSync());
        return imageData;
      } else {
        print('No image selected.');
      }
    });

    // ImagePicker imagePicker = ImagePicker();
    // final image = await ImagePicker.pickImage(source: ImageSource.camera);
    // imageSelected = File(image.path);

    // var caminho = image.path;
    // var bytes = image.readAsBytesSync();
    // print(caminho);
    // print(bytes);
    // setState(() {
    //   imageSelected = image;
    // });
  }

  Future<String> pickImage() async {
    PickedFile pickedFile;
    File file;
    ImagePicker imagePicker = ImagePicker();

    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);

      String image = base64Encode(file.readAsBytesSync());
      return image;
    } else {
      print('Pick Image First');
      return 'Error';
    }
  }

  void adicionar() {
    if (_formKeyCadastro.currentState.validate()) {
      final FastCadastro cadastroForm = FastCadastro(
          nome: nome,
          sobrenome: sobrenome,
          isCompleted: isCompleted,
          image: imageData);

      Provider.of<CadastroFastProvider>(context, listen: false)
          .cadastrarFastForm(cadastroForm);
      print(cadastroForm);
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
                      child: imageSelected != null
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
                                  child: Image.file(imageSelected),
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
                        adicionar();

                        // Navigator.of(context).pop();
                      },
                      child: Text('Submit Data')),
                ],
              ),
            ),
          ),
        ));
  }
}
