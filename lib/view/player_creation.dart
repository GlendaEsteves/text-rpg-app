import 'package:flutter/material.dart';
import 'package:text_rpg/model/character/classes.dart';
import 'package:text_rpg/model/character/player.dart';

class PlayerCreation extends StatelessWidget {
  PlayerCreation({Key? key}) : super(key: key);

  final TextEditingController _controllerPlayerName = TextEditingController();
  final _buttonOneContainer = const Text('Guerreiro');
  final _buttonTwoContainer = const Text('Arqueiro');
  final _buttonThreeContainer = const Text('Mago');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text RPG')),
      body: Center(
        child: Column(
          children: [
            TextFormField(controller: _controllerPlayerName),
            ElevatedButton(
                onPressed: () {
                  Player player = Player(
                      name: _controllerPlayerName.text,
                      clss: Classes(type: _buttonOneContainer.data));
                  print(player.name);
                  print(player.strength);
                  print(player.agility);
                  print(player.inteligence);
                },
                child: Text('Guerreiro')),
            ElevatedButton(
                onPressed: () {
                  Player player = Player(
                      name: _controllerPlayerName.text,
                      clss: Classes(type: _buttonTwoContainer.data));
                },
                child: Text('Arqueiro')),
            ElevatedButton(
                onPressed: () {
                  Player player = Player(
                      name: _controllerPlayerName.text,
                      clss: Classes(type: _buttonThreeContainer.data));
                },
                child: Text('Mago')),
          ],
        ),
      ),
    );
  }
}
