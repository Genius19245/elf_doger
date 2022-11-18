import 'dart:math';
import 'package:elf_doger/components/gift.dart';
import 'package:elf_doger/components/stone.dart';
import 'package:elf_doger/components/stone1.dart';
import 'package:elf_doger/components/utils/audio_manager.dart';
import 'package:elf_doger/model/player_data.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'elf.dart';

class MyGame extends FlameGame
    with
        HasKeyboardHandlerComponents,
        HasCollisionDetection,
        HasGameRef,
        HasTappableComponents {
  late Elf elf;

  // variables
  double y = 150;

  // players
  SpriteComponent player = SpriteComponent();
  SpriteComponent gift = SpriteComponent();
  SpriteComponent stone1 = SpriteComponent();
  TextComponent score = TextComponent();
  TextComponent healthText = TextComponent();

  final Random random = Random();

  // Left left = Left();
  // Right right = Right();

  final playerData = PlayerData();
  final Vector2 buttonSize = Vector2(50.0, 50.0);

  @override
  Future<void> onLoad() async {
    AudioManager.init();
    AudioManager.playBgm('synth.mp3', 'never_still.mp3');
    super.onLoad();
    add(SpriteComponent()
      ..sprite = await loadSprite('back.jpeg')
      ..size = size);
    add(Elf(
      sprite: await loadSprite('elf.png'),
      position: Vector2(300, 500),
      size: Vector2(125, 125),
    ));

    elf = Elf();
    //
    add(Gift(await loadSprite('gift.png')));
    add(Stone(await loadSprite('stone.png'), playerData.score.value));
    add(
      Stone1(await loadSprite('stone.png')),
    );
    add(score
      ..size = Vector2(75.5, 75.5)
      ..position = Vector2(15, 26)
      ..text = 'Score: ${playerData.score.value}');
    playerData.score.addListener(() {
      score.text = 'Score: ${playerData.score.value}';
    });
    add(healthText
      ..size = Vector2(75.5, 75.5)
      ..position = Vector2(1000, 10)
      ..text = 'Health: ${playerData.health.value}');
    playerData.health.addListener(() {
      healthText.text = 'Health: ${playerData.health.value}';
    });
  }

  @override
  void update(dt) {
    super.update(dt);
    elf.size = Vector2(playerData.size.value, playerData.size.value);
    healthText.text = 'Health: ${playerData.health.value}';
    if (playerData.health.value == 0) {
      gameRef.pauseEngineFn;
    }

    // for score component
  }
}
