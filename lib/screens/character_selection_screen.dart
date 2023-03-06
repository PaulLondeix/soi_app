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
    } else {
      setState(() {
        characters.remove(characters[currentIndex]);
      });
    }
  }

  void createGameAndNavigate() {
    Navigator.pushReplacementNamed(
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
        title: const Text('Sélectionnez votre personnage'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/stars_background.gif",
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Center(
                child: CarouselSlider(
                  items: characters.map((character) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            character.name,
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Image.asset(
                            character.imagePath,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.7,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.8,
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
              ElevatedButton(
                onPressed: () {
                  selectCharacter(_currentIndex);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sélectionner',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
