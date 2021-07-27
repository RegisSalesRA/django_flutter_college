import 'package:flutter/material.dart';
import 'package:frontend_flutter/api/api_form.dart';
import 'package:provider/provider.dart';

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
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    didChangeDependencies();
    super.dispose();
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
        body: Container(
            child: ListView.builder(
                itemCount: cadastros.length,
                itemBuilder: (BuildContext context, index) {
                  return FittedBox(
                      child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed(
                      //   ObrasConstrutora.routeName,
                      //   arguments: id,
                      // );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1.0),
                              child: Image.network(
                                cadastros[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 105,
                            height: 60,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    cadastros[index].nome,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ),
                                Container(
                                    width: 105,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 3, right: 3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Rua Bueno Costa Augusto Nunes',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "(85) 91234-1234",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "contato@timehouse.com.br",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
                })));
  }
}
