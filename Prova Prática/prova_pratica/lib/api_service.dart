import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

class ApiService {
  final String url = 'https://api.example.com/items'; // URL da API (usada como exemplo)

  Future<List<Item>> fetchItems() async {
    try {
      // Simulando a resposta de uma API com dados no formato JSON
      final response = '''[
        {"id": 1, "name": "Mesa", "description": "Uma mesa de madeira, ideal para estudo ou trabalho."},
        {"id": 2, "name": "Cadeira", "description": "Cadeira ergonômica com encosto ajustável."},
        {"id": 3, "name": "Caderno", "description": "Caderno universitário com capa dura e 100 folhas."}
      ]''';

      // Simulando um atraso de rede
      await Future.delayed(Duration(seconds: 2));

      // Decodificando o JSON (convertendo a string JSON para um objeto Dart)
      Iterable list = json.decode(response);

      // Convertendo para uma lista de objetos Item
      return list.map((item) => Item.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Erro de rede ou conversão de dados: $e');
    }
  }
}
