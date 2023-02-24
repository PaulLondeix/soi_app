import '../enums/character.dart';

class Player {
  int life;
  int mastery;
  Character character;

  Player({
    this.life = 50,
    this.mastery = 0,
    required this.character,
  });

  void incrementLife() {
    if (life < 50) {
      life++;
    }
  }

  void decrementLife() {
    if (life > 0) {
      life--;
    }
  }

  void incrementMastery() {
    if (mastery < 30) {
      mastery++;
    }
  }

  void decrementMastery() {
    if (mastery > 0) {
      mastery--;
    }
  }
}
