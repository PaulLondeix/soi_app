import 'package:flutter/material.dart';
import '../widgets/player_counters.dart';
import '../models/game.dart';

class CountersScreen extends StatelessWidget {
  static const routeName = '/counters';

  const CountersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Game game = ModalRoute.of(context)!.settings.arguments as Game;
    return Scaffold(
      body: Column(
        children: [
          for (var player in game.players)
            Expanded(
              child: PlayerCounter(player: player),
            ),
        ],
      ),
    );
  }
}
