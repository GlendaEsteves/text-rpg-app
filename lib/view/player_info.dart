import 'package:flutter/material.dart';
import 'package:text_rpg/model/days.dart';
import 'package:text_rpg/view/game.dart';

import '../model/character/player.dart';

class PlayerInfo extends StatefulWidget {
  PlayerInfo({Key? key, required this.player}) : super(key: key);

  Player player;
  @override
  State<PlayerInfo> createState() => _PlayerInfoState();
}

class _PlayerInfoState extends State<PlayerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogador: ${widget.player.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(15),
                color: Colors.blue,
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.white, fontSize: 26),
                      children: <TextSpan>[
                        TextSpan(text: 'HP: ${widget.player.hp}\n'),
                        TextSpan(text: 'MP: ${widget.player.mp}\n'),
                        TextSpan(text: 'Atributos:\n'),
                        TextSpan(
                            text: '    Strength: ${widget.player.strength}\n'),
                        TextSpan(
                            text: '    Agility: ${widget.player.agility}\n'),
                        TextSpan(
                            text:
                                '    Inteligence: ${widget.player.inteligence}\n'),
                        TextSpan(text: 'Level: ${widget.player.lvl}\n'),
                        TextSpan(text: 'Experience: ${widget.player.exp}\n'),
                        TextSpan(text: 'Money: ${widget.player.money}'),
                      ]),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  widget.player.playerExist = true;
                  Days day = Days();
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PlayerChoice(player: widget.player, day: day)));
                },
                child: Text(FirstTime(widget.player)))
          ],
        ),
      ),
    );
  }
}

String FirstTime(Player player) {
  String textStartButton = '';
  if (player.playerExist == false) {
    textStartButton = 'Começar!';
  } else if (player.playerExist == true) {
    textStartButton = 'Continuar!';
  }
  return textStartButton;
}
