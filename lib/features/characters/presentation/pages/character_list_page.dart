import 'dart:io';

import 'package:buildforge/features/characters/domain/entities/character.dart';
import 'package:buildforge/features/characters/presentation/widgets/character_card.dart';
import 'package:flutter/material.dart';

class ListaPersonagens extends StatefulWidget {
  ListaPersonagens({super.key});

  @override
  State<ListaPersonagens> createState() => _ListaPersonagensState();
}

class _ListaPersonagensState extends State<ListaPersonagens> {
  List<Character> personagens = [];
  var isLoading = true;
  @override
  void initState() {
    super.initState();
    carregaPersonagens(items);
  }

  final List<Character> items = [
    Character(id: 1, characterClass: 'Ferreiro', level: 10, name: 'Cleiton'),
    Character(id: 2, characterClass: 'Guerreiro', level: 5, name: 'Arthur'),
    Character(id: 3, characterClass: 'Mago', level: 3, name: 'Merlin'),
    Character(id: 4, characterClass: 'Arqueiro', level: 7, name: 'Robin'),
  ];

  Future<List<Character>> loadCharacters() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return items;
  }

  Future<void> carregaPersonagens() async {
    final fichas = await loadCharacters();
    if (!mounted) return;

    setState(() {
      personagens = fichas;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator(color: Colors.green))
        : Scaffold(
            backgroundColor: const Color(
              0xFF3A2512,
            ), // Carvalho quente (mais âmbar, zero vinho)
            appBar: AppBar(
              backgroundColor: const Color(
                0xFF24160A,
              ), // Madeira escura de tábua
              surfaceTintColor: Colors
                  .transparent, // Remove o reflexo roxo padrão do Flutter!
              centerTitle: true,
              elevation: 6,
              shadowColor: Colors.black,
              title: const Text(
                "MEUS HERÓIS",
                style: TextStyle(
                  color: Color(0xFFF6D365),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 12, bottom: 20),
                itemCount: personagens.length,
                itemBuilder: (context, index) {
                  return CharacterCard(
                    characters: personagens[index],
                    key: ValueKey(personagens[index].id),
                  );
                },
              ),
            ),
          );
  }
}
