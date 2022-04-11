import 'package:text_rpg/model/areas/city.dart';
import 'package:text_rpg/model/areas/fighting_areas.dart';
import 'package:text_rpg/model/character/player.dart';
import 'package:text_rpg/model/enemies/enemies.dart';
import 'package:text_rpg/model/fight.dart';

import 'days.dart';
import 'enemies/boss.dart';

class Game {
  Player player;
  Days day;
  Enemies enemies;
  Boss boss;
  Fight fight;
  City city;
  FightingAreas areas;

  Game(
      {required this.player,
      required this.day,
      required this.enemies,
      required this.boss,
      required this.fight,
      required this.city,
      required this.areas});

  void gameStart() {
    player.playerExist == true;
    if (day.day < 10) {
    } else if (day.day == 10) {}
  }
}
