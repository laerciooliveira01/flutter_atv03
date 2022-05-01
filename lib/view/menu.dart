import 'package:flutter/material.dart';
import 'package:sigla_paises_app/view/ajuda.dart';
import 'package:sigla_paises_app/view/mensagem.dart';
import 'package:sigla_paises_app/view/paises_screen.dart';

class Menu extends StatelessWidget with Mensagem {
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.orangeAccent,
                height: 100.0,
                child: Text(
                  "Menu",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text("Pesquisar"),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SimpleDialog(
                            title: Text("Digite o nome do país"),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: search,
                                ),
                              ),
                              ButtonBar(
                                children: [
                                  MaterialButton(
                                    child: Text("Cancelar"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      showMensagem(
                                          "Operação cancelada.", context);
                                    },
                                  ),
                                  MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        PaisesScreen(
                                                            pais:
                                                                search.text)));
                                      },
                                      child: Text("Ok",
                                          style: TextStyle(
                                              color: Colors.orangeAccent,
                                              fontWeight: FontWeight.bold))
                                  ),
                                ],
                              )
                            ],
                          ));
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Ajuda"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Ajuda()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
