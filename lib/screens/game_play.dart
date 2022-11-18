import 'package:elf_doger/components/menu_Overlays.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/game.dart';

MyGame myGame = MyGame();
// MobileGame mobile = MobileGame();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: 1280,
        height: 720,
        child: GameWidget(
          game: myGame,
        ),
      ),
    );
  }
}
