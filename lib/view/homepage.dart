import 'package:flutter/material.dart';
import 'package:text_rpg/view/player_creation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    child: Text('Jogar')))
          ],
        ),
      ),
    );
  }
}
