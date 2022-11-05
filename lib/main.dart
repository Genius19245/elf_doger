import 'package:elf_doger/components/game.dart';
import 'package:elf_doger/screens/splashScreen.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    themeMode: ThemeMode.dark,
    home: SplashScreen(),
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
        body: GameWidget(
          game: MyGame(),
        ),
      ),
    );
  }
}
