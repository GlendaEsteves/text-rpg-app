import 'classes.dart';

class Player {
  String name;
  late int strength = str();
  late int agility = agi();
  late int inteligence = intl();
  late int hp = str() * 5;
  late int mp = intl() * 5;
  late int init = agi() * 3;
  int lvl = 1;
  int exp = 0;
  int money = 100;
  Classes clss;

  Player({required this.name, required this.clss});

  int str() {
    clss.setModStr();
    return clss.modStr;
  }

  int agi() {
    clss.setModAgi();
    return clss.modAgi;
  }

  int intl() {
    clss.setModInt();
    return clss.modInt;
  }
}
