import 'package:flutter/material.dart';

class Ajuda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Ajuda"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Text("Este aplicativo tem o objetivo de listar e"
                    "pesquisar as siglas dos países."),
      ),
    );
  }
}
