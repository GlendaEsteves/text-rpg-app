import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_rpg/view/player_choice.dart';
import 'package:text_rpg/view/player_creation.dart';
import 'package:text_rpg/view/player_info.dart';

import '../model/character/player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name;
  late int str;
  late int agi;
  late int intl;
  late int lvl;
  late int exp;
  late int money;
  late bool exists;

  @override
  void initState() {
    super.initState();
    _loadPlayer();
  }

  void _loadPlayer() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('name')) {
      setState(() {
        name = (prefs.getString('name') ?? '');

        str = (prefs.getInt('strength'))!;

        agi = (prefs.getInt('agility'))!;

        intl = (prefs.getInt('inteligence'))!;

        lvl = (prefs.getInt('lvl'))!;

        exp = (prefs.getInt('exp'))!;

        money = (prefs.getInt('money'))!;
      });
    }
  }

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
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: const Text('Começando sua aventura'),
              ),
            ),
            Expanded(
                child: ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayerCreation()));
                    },
                    child: Text('Jogar'))),
            Expanded(
                child:
                    ElevatedButton(onPressed: null, child: Text('Continuar')))
          ],
        ),
      ),
    );
  }
}
