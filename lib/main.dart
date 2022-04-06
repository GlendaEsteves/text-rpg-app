import 'package:flutter/material.dart';
import 'package:text_rpg/view/homepage.dart';

void main() {
  runApp(const RpgApp());
}

class RpgApp extends StatelessWidget {
  const RpgApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text RPG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Text RPG'),
    );
  }
}
