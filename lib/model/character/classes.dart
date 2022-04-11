import 'package:flutter/cupertino.dart';

class Classes extends ChangeNotifier {
  String type;
  late int modStr;
  late int modAgi;
  late int modInt;

  Classes({this.type = 'Guerreiro'});

  void setType(String newType) {
    type = newType;
    notifyListeners();
  }

  int setModStr() {
    switch (type) {
      case 'Guerreiro':
        modStr = 9;
        break;
      case 'Arqueiro':
        modStr = 5;
        break;
      case 'Mago':
        modStr = 5;
        break;
    }
    return modStr;
  }

  int setModAgi() {
    switch (type) {
      case 'Guerreiro':
        modAgi = 7;
        break;
      case 'Arqueiro':
        modAgi = 9;
        break;
      case 'Mago':
        modAgi = 7;
        break;
    }
    return modAgi;
  }

  int setModInt() {
    switch (type) {
      case 'Guerreiro':
        modInt = 5;
        break;
      case 'Arqueiro':
        modInt = 7;
        break;
      case 'Mago':
        modInt = 9;
        break;
    }
    return modInt;
  }
}
