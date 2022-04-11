import 'package:text_rpg/model/character/player.dart';

class City {
  Player player;

  City({required this.player});

  void training(Player player, String? atribute) {
    switch (atribute) {
      case 'Força':
        player.addStr();
        break;
      case 'Agilidade':
        player.addAgi();
        break;
      case 'Inteligência':
        player.addInt();
        break;
    }
  }

  void job(Player player) {}
}
