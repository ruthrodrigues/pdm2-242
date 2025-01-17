import 'package:flutter/material.dart';

void main() {
  runApp(AppReceitas());
}

class AppReceitas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site de Receitas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Site de Receitas'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: const Color.fromARGB(255, 216, 118, 175)),
              child: Text('Receitas', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text('Bolo de Chocolate'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceitaScreen(
                    title: 'Bolo de Chocolate',
                    ingredientes: ['2 xícaras de farinha de trigo', '1 xícara de açúcar', '3 ovos', '1 xícara de leite', '1/2 xícara de manteiga', '1 xícara de achocolatado em pó', '1 colher de fermento em pó'],
                    preparo: 'Bata todos os ingredientes no liquidificador e asse a 180°C por 30 minutos.',
                  )),
                );
              },
            ),
            ListTile(
              title: Text('Pudim de Leite Condensado'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceitaScreen(
                    title: 'Pudim de Leite Condensado',
                    ingredientes: ['1 lata de leite condensado', '2 latas de leite', '3 ovos', '1 xícara de açúcar para a calda'],
                    preparo: 'Caramelize o açúcar, bata os outros ingredientes e asse em banho-maria por 50 minutos a 180°C.',
                  )),
                );
              },
            ),
            ListTile(
              title: Text('Torta de Frango'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceitaScreen(
                    title: 'Torta de Frango',
                    ingredientes: ['1 peito de frango desfiado', '2 xícaras de farinha de trigo', '1/2 xícara de óleo', '1 cebola picada', '1 tomate picado', 'Queijo ralado'],
                    preparo: 'Misture todos os ingredientes, coloque em uma forma e asse por 40 minutos a 180°C.',
                  )),
                );
              },
            ),
            ListTile(
              title: Text('Panqueca'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceitaScreen(
                    title: 'Panqueca',
                    ingredientes: ['1 xícara de farinha de trigo', '1 xícara de leite', '1 ovo', '1 colher de sopa de manteiga', 'Recheio a gosto'],
                    preparo: 'Bata tudo no liquidificador e frite em uma frigideira.',
                  )),
                );
              },
            ),
            ListTile(
              title: Text('Mousse de Maracujá'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceitaScreen(
                    title: 'Mousse de Maracujá',
                    ingredientes: ['1 lata de leite condensado', '1 lata de creme de leite', '1 maracujá', '1 pacote de gelatina'],
                    preparo: 'Misture tudo no liquidificador e leve à geladeira por 2 horas.',
                  )),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bem-vindo ao site de receitas de Ruth e Victor!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class ReceitaScreen extends StatelessWidget {
  final String title;
  final List<String> ingredientes;
  final String preparo;

  ReceitaScreen({required this.title, required this.ingredientes, required this.preparo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredientes:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            for (var ingrediente in ingredientes) Text('- $ingrediente'),
            SizedBox(height: 20),
            Text('Modo de preparo:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(preparo),
          ],
        ),
      ),
    );
  }
}
