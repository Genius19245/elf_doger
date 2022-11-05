import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../components/game.dart';

MyGame _myGame = MyGame();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: _myGame);
  }
}
