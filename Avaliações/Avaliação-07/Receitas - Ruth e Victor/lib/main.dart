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
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Site de Receitas'),
        backgroundColor: Colors.pink[300],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink[200]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Text(
                      'R&V',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.pink[300]),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Receitas de Ruth e Victor', style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            _buildRecipeListTile(context, 'Bolo de Chocolate'),
            _buildRecipeListTile(context, 'Pudim de Leite Condensado'),
            _buildRecipeListTile(context, 'Torta de Frango'),
            _buildRecipeListTile(context, 'Panqueca'),
            _buildRecipeListTile(context, 'Mousse de Maracujá'),
            _buildRecipeListTile(context, 'Brigadeiro'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Bem-vindo ao site de receitas de Ruth e Victor!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink[300]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Aqui você encontrará receitas deliciosas para todos os gostos.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  List<String> titles = [
                    'Bolo de Chocolate',
                    'Pudim de Leite Condensado',
                    'Torta de Frango',
                    'Panqueca',
                    'Mousse de Maracujá',
                    'Brigadeiro',
                  ];

                  return Card(
                    color: Colors.pink[50],
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReceitaScreen(
                              title: titles[index],
                              ingredientes: _getIngredientes(titles[index]),
                              preparo: _getPreparo(titles[index]),
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          titles[index],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink[600]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeListTile(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReceitaScreen(
              title: title,
              ingredientes: _getIngredientes(title),
              preparo: _getPreparo(title),
            ),
          ),
        );
      },
    );
  }

  List<String> _getIngredientes(String title) {
    switch (title) {
      case 'Bolo de Chocolate':
        return [
          '2 xícaras de farinha de trigo',
          '1 xícara de açúcar',
          '3 ovos',
          '1 xícara de leite',
          '1/2 xícara de manteiga',
          '1 xícara de achocolatado em pó',
          '1 colher de fermento em pó',
        ];
      case 'Pudim de Leite Condensado':
        return [
          '1 lata de leite condensado',
          '2 latas de leite',
          '3 ovos',
          '1 xícara de açúcar para a calda',
        ];
      case 'Torta de Frango':
        return [
          '1 peito de frango desfiado',
          '2 xícaras de farinha de trigo',
          '1/2 xícara de óleo',
          '1 cebola picada',
          '1 tomate picado',
          'Queijo ralado',
        ];
      case 'Panqueca':
        return [
          '1 xícara de farinha de trigo',
          '1 xícara de leite',
          '1 ovo',
          '1 colher de sopa de manteiga',
          'Recheio a gosto',
        ];
      case 'Mousse de Maracujá':
        return [
          '1 lata de leite condensado',
          '1 lata de creme de leite',
          '1 maracujá',
          '1 pacote de gelatina',
        ];
      case 'Brigadeiro':
        return [
          '1 lata de leite condensado',
          '2 colheres de sopa de achocolatado em pó',
          '1 colher de sopa de manteiga',
          'Chocolate granulado',
        ];
      default:
        return [];
    }
  }

  String _getPreparo(String title) {
    switch (title) {
      case 'Bolo de Chocolate':
        return 'Bata todos os ingredientes no liquidificador e asse a 180°C por 30 minutos.';
      case 'Pudim de Leite Condensado':
        return 'Caramelize o açúcar, bata os outros ingredientes e asse em banho-maria por 50 minutos a 180°C.';
      case 'Torta de Frango':
        return 'Misture todos os ingredientes, coloque em uma forma e asse por 40 minutos a 180°C.';
      case 'Panqueca':
        return 'Bata tudo no liquidificador e frite em uma frigideira.';
      case 'Mousse de Maracujá':
        return 'Misture tudo no liquidificador e leve à geladeira por 2 horas.';
      case 'Brigadeiro':
        return 'Leve todos os ingredientes ao fogo, mexendo sempre, até desgrudar do fundo da panela. Enrole em bolinhas e passe no granulado.';
      default:
        return '';
    }
  }
}

class ReceitaScreen extends StatefulWidget {
  final String title;
  final List<String> ingredientes;
  final String preparo;

  ReceitaScreen({
    required this.title,
    required this.ingredientes,
    required this.preparo,
  });

  @override
  _ReceitaScreenState createState() => _ReceitaScreenState();
}

class _ReceitaScreenState extends State<ReceitaScreen> {
  List<bool> _checkedIngredientes = [];

  @override
  void initState() {
    super.initState();
    _checkedIngredientes = List.generate(widget.ingredientes.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.pink[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredientes:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pink[700])),
            SizedBox(height: 10),
            Column(
              children: [
                for (int i = 0; i < widget.ingredientes.length; i++)
                  CheckboxListTile(
                    value: _checkedIngredientes[i],
                    onChanged: (bool? value) {
                      setState(() {
                        _checkedIngredientes[i] = value!;
                      });
                    },
                    title: Text(widget.ingredientes[i], style: TextStyle(fontSize: 18)),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.pink[400],
                  ),
              ],
            ),
            SizedBox(height: 20),
            Text('Modo de preparo:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pink[700])),
            SizedBox(height: 10),
            Text(widget.preparo, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}