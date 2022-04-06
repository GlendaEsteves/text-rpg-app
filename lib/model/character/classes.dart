class Classes {
  String? type;
  late int modStr;
  late int modAgi;
  late int modInt;

  Classes({required this.type});

  void setModStr() {
    switch (type) {
      case 'Guerreiro':
        modStr = 9;
        break;
      case 'Arqueiro':
        modStr = 5;
        break;
      case 'Mago':
        modStr = 5;
    }
  }

  void setModAgi() {
    switch (type) {
      case 'Guerreiro':
        modAgi = 7;
        break;
      case 'Arqueiro':
        modAgi = 9;
        break;
      case 'Mago':
        modAgi = 7;
    }
  }

  void setModInt() {
    switch (type) {
      case 'Guerreiro':
        modInt = 5;
        break;
      case 'Arqueiro':
        modInt = 7;
        break;
      case 'Mago':
        modInt = 9;
    }
  }
}
