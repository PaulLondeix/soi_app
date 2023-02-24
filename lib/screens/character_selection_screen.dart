import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../enums/character.dart';

class CharacterSelectionScreen extends StatefulWidget {
  @override
  _CharacterSelectionScreenState createState() =>
      _CharacterSelectionScreenState();
}

class _CharacterSelectionScreenState extends State<CharacterSelectionScreen> {
  List<String> images = [
    Character.decima.imagePath,
    Character.koSynWu.imagePath,
    Character.rez.imagePath,
    Character.tetra.imagePath,
    Character.volos.imagePath,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélection d\'images'),
      ),
      body: Center(
        child: CarouselSlider(
          items: images.map((image) {
            return Container(
              child: Image.asset(
                image,
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
                Navigator.pop(context, images[_currentIndex]);
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
