import 'dart:convert';

import 'package:http/http.dart' as http;

class Requisicao {
  static Future<List> requisitarPaises() async {
    Map paises = new Map();
    String apiUrl = "https://api.nobelprize.org/v1/country.json";
    http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      paises = json.decode(response.body);
      return paises.values.first;
    } else {
      throw Exception("Erro na requisição!");
    }
  }
}
