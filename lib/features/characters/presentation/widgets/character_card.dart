import 'package:buildforge/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatefulWidget {
  final Character characters;

  const CharacterCard({super.key, required this.characters});

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1,
        duration: const Duration(milliseconds: 100),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Colors.black87,
                blurRadius: 8,
                offset: Offset(0, 5),
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF6D365), Color(0xFF9C6B21)],
            ),
          ),
          padding: const EdgeInsets.all(3),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              gradient: const RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [Color(0xFFF7E8C8), Color(0xFFD5B886)],
              ),
            ),
            child: Row(
              children: [
                _retratoHeroi(),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.characters.name,
                        style: const TextStyle(
                          color: Color(0xFF2E180B),
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.characters.characterClass.toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFF7A4B2A), // Marrom avermelhado
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
        
                // Gema azul estilo cristal de Mana para o Nível
                _cristalNivel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _retratoHeroi() {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF5C3A18), // Aro de madeira/bronze
          width: 3,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5C3D1E), // Couro claro / bronze
            Color(0xFF2B1A0B), // Marrom café escuro
          ],
        ),

        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Center(
        child: Text(
          widget.characters.name[0],
          style: const TextStyle(
            color: Color(0xFFF6D365),
            fontSize: 22,
            fontWeight: FontWeight.w900,
            shadows: [
              Shadow(color: Colors.black, blurRadius: 4, offset: Offset(1, 2)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cristalNivel() {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFD4AF37), width: 2.5),
        // Gradiente azul brilhante igual à gema de mana do Hearthstone
        gradient: const RadialGradient(
          center: Alignment(-0.3, -0.3), // Ponto de brilho no canto superior
          colors: [
            Color(0xFF64D2FF), // Brilho ciano
            Color(0xFF0066CC), // Azul royal
            Color(0xFF002B5E), // Azul profundo na borda
          ],
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Center(
        child: Text(
          '${widget.characters.level}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            shadows: [
              Shadow(color: Colors.black, blurRadius: 3, offset: Offset(1, 1)),
            ],
          ),
        ),
      ),
    );
  }
}
