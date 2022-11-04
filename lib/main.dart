import 'package:elf_doger/components/game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(
    game: MyGame(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Elf Dodger'),
        ),
        body: Stack(
          children: [
            GameWidget(
              mouseCursor: SystemMouseCursors.move,
              game: MyGame(),
            ),
          ],
        ),
      ),
    );
  }
}
