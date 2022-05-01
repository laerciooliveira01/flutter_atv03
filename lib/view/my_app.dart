import 'package:flutter/material.dart';
import 'package:sigla_paises_app/view/paises_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sigla dos Paises',
      home: PaisesScreen(),
    );
  }
}