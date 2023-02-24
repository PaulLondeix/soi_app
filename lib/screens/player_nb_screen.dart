import 'package:flutter/material.dart';
import 'package:soi_app/screens/character_selection_screen.dart';
import './counters_screen.dart';
import '../models/game.dart';
import '../models/player.dart';
import '../enums/character.dart';

class PlayerNbScreen extends StatelessWidget {
  static const routeName = '/select-player-number';

  const PlayerNbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/shards_of_infinity_game_cover.png",
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              PlayerButton(
                text: "1 Joueur",
                playerNb: 1,
              ),
              SizedBox(height: 20),
              PlayerButton(
                text: "2 Joueurs",
                playerNb: 2,
              ),
              SizedBox(height: 20),
              PlayerButton(
                text: "3 Joueurs",
                playerNb: 3,
              ),
              SizedBox(height: 20),
              PlayerButton(
                text: "4 Joueurs",
                playerNb: 4,
              ),
              SizedBox(height: 20),
              PlayerButton(
                text: "5 Joueurs",
                playerNb: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlayerButton extends StatelessWidget {
  final String text;
  final int playerNb;
  const PlayerButton({
    required this.text,
    required this.playerNb,
    Key? key,
  }) : super(key: key);

  void navigateToCharacterSelection(BuildContext context, int nbPlayer) {
    Navigator.pushNamed(context, CharacterSelectionScreen.routeName,
        arguments: nbPlayer);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          navigateToCharacterSelection(context, playerNb);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          primary: Colors.blue,
          elevation: 2,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
