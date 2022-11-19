import 'package:elf_doger/components/game.dart';
import 'package:elf_doger/utils/audio_manager.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class Elf extends SpriteComponent //
    with
        KeyboardHandler,
        CollisionCallbacks,
        HasGameRef<MyGame> {
  Elf({super.sprite}) {
    debugMode = true;
    size = Vector2(69.0, 128.0);
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  final Vector2 _velocity = Vector2.zero();
  late final double _speed;
  double xAxisInput = 0.0;

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    position = gameRef.size / 2;
    _speed = gameRef.size.x / 4;
  }

  @override
  void update(double dt) {
    super.update(dt);
    _velocity.x = xAxisInput * _speed;
    position += _velocity * dt;
    if (x < 0.0) {
      x = gameRef.size.x;
    } else if (x > gameRef.size.x) {
      x = 0;
    }
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    xAxisInput = 0.0;
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      xAxisInput += -2.0;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      xAxisInput += 2.0;
    }
    return true;
  }

  void hitByStone() {
    gameRef.health.value--;
    if (gameRef.score.value > 0) {
      gameRef.score.value--;
    }
    AudioManager.playSfx('hit.mp3');
  }
}
