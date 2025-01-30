import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:receitas/main.dart';

void main() {
  testWidgets('Navegação pelo Drawer e exibição de receitas', (WidgetTester tester) async {

    await tester.pumpWidget(AppReceitas());

    await tester.tap(find.byIcon(Icons.menu));  
    await tester.pump();

    expect(find.text('Bolo de Chocolate'), findsOneWidget);
    expect(find.text('Pudim de Leite Condensado'), findsOneWidget);
    expect(find.text('Torta de Frango'), findsOneWidget);
    expect(find.text('Panqueca'), findsOneWidget);
    expect(find.text('Mousse de Maracujá'), findsOneWidget);

    await tester.tap(find.text('Bolo de Chocolate'));
    await tester.pumpAndSettle();

    expect(find.text('Bolo de Chocolate'), findsOneWidget);
    expect(find.text('Ingredientes:'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Bem-vindo ao site de receitas de Ruth e Victor!'), findsOneWidget);
  });
}
