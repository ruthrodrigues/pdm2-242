class Item {
  final int id;
  final String name;
  final String description;

  Item({
    required this.id,
    required this.name,
    required this.description,
  });

  // Método para criar um Item a partir de um JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
