import 'package:flutter/material.dart';
import 'package:text_rpg/model/character/classes.dart';
import 'package:text_rpg/model/days.dart';
import 'package:text_rpg/view/homepage.dart';
import 'package:provider/provider.dart';
import 'package:text_rpg/view/game.dart';
import 'package:text_rpg/view/player_creation.dart';

import 'model/character/player.dart';

void main() {
  runApp(RpgApp());
}

class RpgApp extends StatelessWidget {
  RpgApp({Key? key}) : super(key: key);

  Classes clss = Classes();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Player(clss: clss)),
          ChangeNotifierProvider(create: (context) => Days()),
          ChangeNotifierProvider(create: (context) => Classes())
        ],
        child: MaterialApp(title: 'RPG App', initialRoute: '/', routes: {
          '/': (context) => const HomePage(
                title: 'Text RPG',
              ),
          '/playerCreation': (context) => PlayerCreation(),
          '/game': (context) =>
              PlayerChoice(player: Player(clss: clss), day: Days()),
        }));
  }
}
