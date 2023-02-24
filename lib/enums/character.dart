enum Character {
  decima,
  koSynWu,
  rez,
  tetra,
  volos,
}

extension CharacterExtension on Character {
  String get name {
    switch (this) {
      case Character.decima:
        return 'Decima';
      case Character.koSynWu:
        return 'Ko Syn Wu';
      case Character.rez:
        return 'Rez';
      case Character.tetra:
        return 'Tetra';
      case Character.volos:
        return 'Volos';
      default:
        return '';
    }
  }

  String get imagePath {
    switch (this) {
      case Character.decima:
        return 'assets/images/characters/decima.png';
      case Character.koSynWu:
        return 'assets/images/characters/ko_syn_wu.png';
      case Character.rez:
        return 'assets/images/characters/rez.png';
      case Character.tetra:
        return 'assets/images/characters/tetra.png';
      case Character.volos:
        return 'assets/images/characters/volos.png';
      default:
        return '';
    }
  }
}
