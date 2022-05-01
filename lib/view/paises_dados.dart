import 'package:flutter/material.dart';
import 'package:sigla_paises_app/service/requisicao.dart';

class PaisesDados extends StatefulWidget {

  final String pais;
  PaisesDados({this.pais = ""});

  @override
  _PaisesDadosState createState() => _PaisesDadosState();
}

class _PaisesDadosState extends State<PaisesDados> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            FutureBuilder(
                future: Requisicao.requisitarPaises(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                  if(snapshot.hasData){
                    List? paises = snapshot.data;
                    return _listaPaises(_filtrarPais(widget.pais, paises!, context));
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text("Carregando...", style: TextStyle(fontSize: 16.0)),
                      ),
                    );
                  }
                })
          ],
        )
    );
  }

  Widget _listaPaises(List paises) {
    if(paises != null) {
      return Flexible(
        child: ListView.builder(
            itemCount: paises.length,
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  child: ListTile(
                    title: Text("${paises[index]["name"]}",
                        style: TextStyle(color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    subtitle: Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("${paises[index]["code"] ?? "--"}",
                            style: TextStyle(color: Colors.grey,
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text("Carregando...", style: TextStyle(fontSize: 16.0)),
        ),
      );
    }
  }

  List _filtrarPais(String pais, List paises, BuildContext context) {
    List filtro = [];

    paises.forEach((p) {
      String name = p["name"] ?? "";
      if(name.toUpperCase() == pais.toUpperCase()){
        filtro.add(p);
      }
    });

    return filtro.isEmpty ? paises : filtro;
  }
}