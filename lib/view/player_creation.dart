import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_rpg/model/character/classes.dart';
import 'package:text_rpg/model/character/player.dart';
import 'package:text_rpg/view/player_info.dart';

class PlayerCreation extends StatefulWidget {
  PlayerCreation({Key? key}) : super(key: key);

  @override
  State<PlayerCreation> createState() => _PlayerCreationState();
}

class _PlayerCreationState extends State<PlayerCreation> {
  final TextEditingController _controllerPlayerName = TextEditingController();

  final _buttonOneContainer = const Text('Guerreiro');

  final _buttonTwoContainer = const Text('Arqueiro');

  final _buttonThreeContainer = const Text('Mago');

  late String name;

  late int str;

  late int agi;

  late int intl;

  late int lvl;

  late int exp;

  late int money;

  late bool exists;

  void updatePlayer(Player player) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = (prefs.getString('name') ?? '');
      prefs.setString('name', player.name);

      str = (prefs.getInt('strength'))!;
      prefs.setInt('strength', player.strength);

      agi = (prefs.getInt('agility'))!;
      prefs.setInt('agility', player.agility);

      intl = (prefs.getInt('inteligence'))!;
      prefs.setInt('inteligence', player.inteligence);

      lvl = (prefs.getInt('lvl'))!;
      prefs.setInt('lvl', player.lvl);

      exp = (prefs.getInt('exp'))!;
      prefs.setInt('exp', player.exp);

      money = (prefs.getInt('money'))!;
      prefs.setInt('money', player.money);

      exists = (prefs.getBool('playerExists') ?? false);
      prefs.setBool('money', player.playerExist);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text RPG')),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: _controllerPlayerName,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  border: UnderlineInputBorder(),
                  hintText: 'Digite seu nome'),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_controllerPlayerName.text != '') {
                    Player player = Player(
                        name: _controllerPlayerName.text,
                        clss: Classes(type: _buttonOneContainer.data));
                    updatePlayer(player);
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayerInfo(player: player)));
                  } else {
                    showSnackBar(context, "PREENCHA SEU NOME");
                  }
                },
                child: Text('Guerreiro')),
            ElevatedButton(
                onPressed: () async {
                  if (_controllerPlayerName.text != '') {
                    Player player = Player(
                        name: _controllerPlayerName.text,
                        clss: Classes(type: _buttonTwoContainer.data));
                    updatePlayer(player);
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayerInfo(player: player)));
                  } else {
                    showSnackBar(context, 'PREENCHA SEU NOME');
                  }
                },
                child: Text('Arqueiro')),
            ElevatedButton(
                onPressed: () async {
                  if (_controllerPlayerName.text != '') {
                    Player player = Player(
                        name: _controllerPlayerName.text,
                        clss: Classes(type: _buttonThreeContainer.data));
                    updatePlayer(player);
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayerInfo(player: player)));
                  } else {
                    showSnackBar(context, 'PREENCHA SEU NOME');
                  }
                },
                child: Text('Mago')),
          ],
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 5),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
