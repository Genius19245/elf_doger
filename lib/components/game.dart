import 'dart:math';
import 'package:elf_doger/components/gift.dart';
import 'package:elf_doger/components/stone.dart';
import 'package:elf_doger/components/stone1.dart';
import 'package:elf_doger/components/utils/audio_manager.dart';
import 'package:elf_doger/model/player_data.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'elf.dart';

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection, HasGameRef {
  late Elf elf;
  // variables
  double y = 150;
  // players
  SpriteComponent player = SpriteComponent();
  SpriteComponent gift = SpriteComponent();
  SpriteComponent stone1 = SpriteComponent();
  TextComponent score = TextComponent();
  final Random random = Random();
  final playerData = PlayerData();

  @override
  Future<void> onLoad() async {
    AudioManager.init();
    AudioManager.playBgm('synth.wav', 'never_still.wav');
    super.onLoad();
    add(SpriteComponent()
      ..sprite = await loadSprite('back.jpeg')
      ..size = size);
    add(Elf(
      sprite: await loadSprite('elf.png'),
      position: Vector2(300, 300),
      size: Vector2(150.5, 150.5),
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
  }

  @override
  void update(dt) {
    super.update(dt);

    score.text = 'Score: ${playerData.score.value}';
    // for score component
  }
}
