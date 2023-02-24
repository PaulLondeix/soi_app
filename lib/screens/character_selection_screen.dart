import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../screens/counters_screen.dart';
import '../models/player.dart';
import '../models/game.dart';
import '../enums/character.dart';

class CharacterSelectionScreen extends StatefulWidget {
  static const routeName = '/character-selection';

  const CharacterSelectionScreen({Key? key}) : super(key: key);

  @override
  _CharacterSelectionScreenState createState() =>
      _CharacterSelectionScreenState();
}

class _CharacterSelectionScreenState extends State<CharacterSelectionScreen> {
  late int playerNb;
  List<Player> players = [];
  List<Character> characters = [
    Character.decima,
    Character.koSynWu,
    Character.rez,
    Character.tetra,
    Character.volos,
  ];

  int _currentIndex = 0;

  void selectCharacter(int currentIndex) {
    players.add(Player(character: characters[currentIndex]));
    if (players.length >= playerNb) {
      createGameAndNavigate();
    }
  }

  void createGameAndNavigate() {
    Navigator.pushNamed(
      context,
      CountersScreen.routeName,
      arguments: Game(players: players),
    );
  }

  @override
  Widget build(BuildContext context) {
    playerNb = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélection d\'images'),
      ),
      body: Center(
        child: CarouselSlider(
          items: characters.map((character) {
            return Container(
              child: Image.asset(
                character.imagePath,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.6,
            initialPage: _currentIndex,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                selectCharacter(_currentIndex);
                // Navigator.pop(context, characters[_currentIndex]);
              },
              child: Text('Sélectionner'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Annuler'),
            ),
          ],
        ),
      ),
    );
  }
}
