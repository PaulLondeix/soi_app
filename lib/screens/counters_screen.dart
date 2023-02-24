import 'package:flutter/material.dart';
import '../models/game.dart';

class CountersScreen extends StatelessWidget {
  static const routeName = '/counters';

  const CountersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Game game = ModalRoute.of(context)!.settings.arguments as Game;
    return Scaffold(
      appBar: AppBar(
        title: Text("Counters"),
      ),
      body: Column(
        children: [
          for (var player in game.players)
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      player.character.name,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => player.decrementLife(),
                        ),
                        Text(
                          "${player.life}",
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => player.incrementLife(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => player.decrementMastery(),
                        ),
                        Text(
                          "${player.mastery}",
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => player.incrementMastery(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
