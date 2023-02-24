import 'package:flutter/material.dart';
import '../models/player.dart';
import '../enums/character.dart';

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
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        image: DecorationImage(
          image: AssetImage(widget.player.character.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.player.character.name,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    widget.player.decrementLife();
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/life.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  "${widget.player.life}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
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
                icon: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    widget.player.decrementMastery();
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/mastery.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  "${widget.player.mastery}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
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
