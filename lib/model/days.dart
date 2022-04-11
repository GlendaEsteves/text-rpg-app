import 'package:flutter/cupertino.dart';

class Days extends ChangeNotifier {
  int day = 1;
  int actionPoints = 3;

  void daysUp() {
    day++;
    notifyListeners();
  }

  void apDown() {
    actionPoints--;
    notifyListeners();
  }
}
