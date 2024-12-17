import 'package:prova_pratica/api_service.dart';

void main() async {
  var apiService = ApiService();

  try {
    var items = await apiService.fetchItems();
    items.forEach((item) {
      print('ID: ${item.id}, Nome: ${item.name}, Descrição: ${item.description}');
    });
  } catch (e) {
    print('Erro: $e');
  }
}
