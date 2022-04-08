import 'package:flutter/material.dart';
import 'package:text_rpg/view/player_info.dart';

import '../model/character/player.dart';

class PlayerChoice extends StatelessWidget {
  PlayerChoice({Key? key, required this.player}) : super(key: key);

  Player player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Para onde quer ir?')),
      body: Padding(
        padding: const EdgeInsets.only(top: 170, left: 10, right: 10),
        child: GridView.count(
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          children: [
            ElevatedButton(
                onPressed: () {
                  showFightingChoices(context);
                },
                child: const Text('Lutar')),
            ElevatedButton(
                onPressed: () {
                  showCityChoices(context);
                },
                child: const Text('Cidade')),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayerInfo(player: player)));
                },
                child: const Text('Informações do Jogador')),
          ],
        ),
      ),
    );
  }
}

showCityChoices(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          title: const Text('O que quer fazer?'),
          content: Container(
            height: 170,
            width: 100,
            child: GridView.count(
              childAspectRatio: 4 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              children: const [
                ElevatedButton(onPressed: null, child: Text('Loja')),
                ElevatedButton(onPressed: null, child: Text('Treinar')),
                ElevatedButton(onPressed: null, child: Text('Trabalhos')),
              ],
            ),
          ),
        );
      });
}

showFightingChoices(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          title: const Text('Onde quer lutar?'),
          content: Container(
            height: 170,
            width: 100,
            child: GridView.count(
              childAspectRatio: 4 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              children: const [
                ElevatedButton(onPressed: null, child: Text('Planícies')),
                ElevatedButton(onPressed: null, child: Text('Floresta')),
                ElevatedButton(onPressed: null, child: Text('Montanhas')),
                ElevatedButton(onPressed: null, child: Text('Pantânos')),
              ],
            ),
          ),
        );
      });
}
