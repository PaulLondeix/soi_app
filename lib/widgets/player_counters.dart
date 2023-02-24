import 'package:flutter/material.dart';
import '../models/player.dart';

class PlayerCounter extends StatefulWidget {
  final Player player;
  const PlayerCounter({Key? key, required this.player}) : super(key: key);

  @override
  State<PlayerCounter> createState() => _PlayerCounterState();
}

class _PlayerCounterState extends State<PlayerCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.player.character.name,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    widget.player.decrementLife();
                  });
                },
              ),
              Text(
                "${widget.player.life}",
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    widget.player.incrementLife();
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    widget.player.decrementMastery();
                  });
                },
              ),
              Text(
                "${widget.player.mastery}",
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    widget.player.incrementMastery();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
