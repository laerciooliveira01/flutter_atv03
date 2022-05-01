import 'package:flutter/material.dart';
import 'package:sigla_paises_app/view/menu.dart';
import 'package:sigla_paises_app/view/paises_dados.dart';

class PaisesScreen extends StatelessWidget {

  final String pais;
  PaisesScreen({this.pais = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Siglas dos Paises"),
        actions: [
          IconButton(icon: Icon(Icons.refresh),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => PaisesScreen(pais: "")));
              },)
        ],
      ),
      body: PaisesDados(pais: pais),
      drawer: Menu(),
    );
  }
}
