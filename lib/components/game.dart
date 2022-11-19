import 'dart:math';
import 'dart:ui';

import 'package:elf_doger/components/gift.dart';
import 'package:elf_doger/components/stone.dart';
import 'package:elf_doger/utils/audio_manager.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;

import 'elf.dart';

class MyGame extends FlameGame //
    with
        HasKeyboardHandlerComponents,
        HasCollisionDetection,
        HasTappableComponents {
  MyGame();

  final random = Random();

  final score = ValueNotifier<int>(0);
  final health = ValueNotifier<int>(10);

  final _scoreText = TextComponent();
  final _healthText = TextComponent();

  late Elf elf;

  @override
  Color backgroundColor() => const Color(0x00000000); // transparent

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Play background music
    AudioManager.init();
    AudioManager.playMusic('synth.mp3', 'never_still.mp3');

    // Add background
    // add(
    //   SpriteComponent()
    //     ..sprite = await loadSprite('back.jpeg')
    //     ..size = size,
    // );

    // Add player
    add(elf = Elf(sprite: await loadSprite('elf.png')));

    // Add gift for player to collect
    add(Gift(sprite: await loadSprite('gift.png')));

    final stoneSprite = await loadSprite('stone.png');

    // Add one small stone
    add(Stone(StoneType.small, sprite: stoneSprite));

    // Add one large stone
    add(Stone(StoneType.large, sprite: stoneSprite));

    // Add score display
    add(
      _scoreText
        ..size = Vector2(75.5, 75.5)
        ..position = Vector2(15.0, 26.0),
    );
    score.addListener(_updateScoreText);
    _updateScoreText();

    // Add health display
    add(
      _healthText
        ..size = Vector2(75.5, 75.5)
        ..position = Vector2(size.x - 26.0, 26.0)
        ..anchor = Anchor.topRight,
    );
    health.addListener(_updateHealthText);
    _updateHealthText();
  }

  void _updateHealthText() {
    _healthText.text = 'Health: ${health.value}';
  }

  void _updateScoreText() {
    _scoreText.text = 'Score: ${score.value}';
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (health.value == 0) {
      pauseEngineFn!();
    }
  }
}
