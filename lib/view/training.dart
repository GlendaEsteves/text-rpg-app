import 'package:flutter/material.dart';
import 'package:text_rpg/model/areas/city.dart';

import '../model/character/player.dart';

class Training extends StatelessWidget {
  Training({Key? key, required this.player}) : super(key: key);

  Player player;

  final _buttonStrength = const Text('Força');
  final _buttonAgility = const Text('Agilidade');
  final _buttonInteligence = const Text('Inteligência');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text('Qual atributo gostaria de treinar?'),
          ElevatedButton(
              onPressed: () {
                City city = City(player: player);
                city.training(player, _buttonStrength.data);
              },
              child: _buttonStrength),
          ElevatedButton(
              onPressed: () {
                City city = City(player: player);
                city.training(player, _buttonAgility.data);
              },
              child: _buttonAgility),
          ElevatedButton(
              onPressed: () {
                City city = City(player: player);
                city.training(player, _buttonInteligence.data);
              },
              child: _buttonInteligence)
        ],
      ),
    );
  }
}
