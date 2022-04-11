import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  @override
  Widget build(BuildContext context) {
    var playerWatcher = context.watch<Player>();
    var classWatcher = context.watch<Classes>();

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
                    classWatcher.setType(_buttonOneContainer.data.toString());
                    playerWatcher.nameChange(_controllerPlayerName.text);
                    playerWatcher.startStr();
                    playerWatcher.startAgi();
                    playerWatcher.startIntl();

                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlayerInfo(player: playerWatcher)));
                  } else {
                    showSnackBar(context, "PREENCHA SEU NOME");
                  }
                },
                child: const Text('Guerreiro')),
            ElevatedButton(
                onPressed: () async {
                  if (_controllerPlayerName.text != '') {
                    classWatcher.setType(_buttonTwoContainer.data.toString());
                    playerWatcher.nameChange(_controllerPlayerName.text);
                    playerWatcher.startStr();
                    playerWatcher.startAgi();
                    playerWatcher.startIntl();

                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlayerInfo(player: playerWatcher)));
                  } else {
                    showSnackBar(context, 'PREENCHA SEU NOME');
                  }
                },
                child: const Text('Arqueiro')),
            ElevatedButton(
                onPressed: () async {
                  if (_controllerPlayerName.text != '') {
                    classWatcher.setType(_buttonThreeContainer.data.toString());
                    playerWatcher.nameChange(_controllerPlayerName.text);
                    playerWatcher.startStr();
                    playerWatcher.startAgi();
                    playerWatcher.startIntl();

                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlayerInfo(player: playerWatcher)));
                  } else {
                    showSnackBar(context, 'PREENCHA SEU NOME');
                  }
                },
                child: const Text('Mago')),
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
