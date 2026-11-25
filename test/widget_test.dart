import 'package:buildforge/features/characters/presentation/pages/character_list_page.dart';
import 'package:buildforge/features/characters/presentation/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('lista os personagens do jogo', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ListaPersonagens(),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(Duration(seconds: 2));
    expect(find.text('MEUS HERÓIS'), findsOneWidget);
    expect(find.text('Cleiton'), findsOneWidget);
    expect(find.byType(CharacterCard), findsNWidgets(4));
  });
}