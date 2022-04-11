import 'package:flutter/material.dart';

import 'classes.dart';

class Player extends ChangeNotifier {
  String? name = 'Hero';
  int strength = 5;
  int agility = 5;
  int inteligence = 5;
  late int hp = strength * 5;
  late int mp = inteligence * 5;
  late int init = agility * 3;
  int lvl = 1;
  int exp = 0;
  int money = 100;
  bool playerExist = false;
  Classes clss;

  Player({name, required this.clss});

  void nameChange(String newName) {
    name = newName;
    notifyListeners();
  }

  void startStr() {
    strength = clss.setModStr();
    notifyListeners();
  }

  void startAgi() {
    agility = clss.setModAgi();
    notifyListeners();
  }

  void startIntl() {
    inteligence = clss.setModInt();
    notifyListeners();
  }

  int lvlUp() {
    lvl++;
    return lvl;
  }

  set expUp(int expPlus) {
    exp += expPlus;
  }

  void addStr() {
    strength++;
    notifyListeners();
  }

  void addAgi() {
    agility++;
    notifyListeners();
  }

  void addInt() {
    inteligence++;
    notifyListeners();
  }

  void addMoney(int moreMoney) {
    money += moreMoney;
    notifyListeners();
  }
}
