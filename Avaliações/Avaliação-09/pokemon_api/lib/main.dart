import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PokemonListScreen(),
    );
  }
}

class PokemonListScreen extends StatefulWidget {
  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<dynamic> pokemonList = [];

  @override
  void initState() {
    super.initState();
    fetchPokemonData();
  }

  Future<void> fetchPokemonData() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        pokemonList = data['results'];
      });
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Pokémon')),
      body: pokemonList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(pokemonList[index]['name'].toUpperCase()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDetailScreen(url: pokemonList[index]['url']),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class PokemonDetailScreen extends StatefulWidget {
  final String url;

  PokemonDetailScreen({required this.url});

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  Map<String, dynamic>? pokemonData;

  @override
  void initState() {
    super.initState();
    fetchPokemonDetails();
  }

  Future<void> fetchPokemonDetails() async {
    final response = await http.get(Uri.parse(widget.url));
    if (response.statusCode == 200) {
      setState(() {
        pokemonData = jsonDecode(response.body);
      });
    } else {
      throw Exception('Falha ao carregar detalhes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemonData?['name']?.toUpperCase() ?? 'Carregando...')),
      body: pokemonData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(pokemonData!['sprites']['front_default']),
                  SizedBox(height: 20),
                  Text('Altura: ${pokemonData!['height']}'),
                  Text('Peso: ${pokemonData!['weight']}'),
                  SizedBox(height: 20),
                  Text('Tipos:'),
                  Column(
                    children: pokemonData!['types'].map<Widget>((typeInfo) {
                      return Text(typeInfo['type']['name'].toUpperCase());
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Text('Estatísticas:'),
                  Column(
                    children: pokemonData!['stats'].map<Widget>((statInfo) {
                      return Text('${statInfo['stat']['name'].toUpperCase()}: ${statInfo['base_stat']}');
                    }).toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
