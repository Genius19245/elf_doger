import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../components/game.dart';

MyGame myGame = MyGame();
// MobileGame mobile = MobileGame();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        IconButton(
          onPressed: () {
            myGame.playerData.mobile.value += 10;
          },
          icon: Icon(
            Icons.arrow_left,
            size: 50,
          ),
        ),
        IconButton(
            onPressed: () {
              myGame.playerData.mobile.value += -10;
            },
            icon: Icon(
              Icons.arrow_right,
              size: 50,
            )),
      ],
      body: FittedBox(
        child: SizedBox(
          width: 1280,
          height: 720,
          child: GameWidget(
            game: myGame,
          ),
        ),
      ),
    );
  }
}
