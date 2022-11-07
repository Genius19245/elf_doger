import 'dart:math';

import 'package:elf_doger/components/game.dart';
import 'package:elf_doger/components/utils/audio_manager.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

import 'elf.dart';

class Stone extends SpriteComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  final Random random = Random();

  Stone(Sprite sprite, int? scores) {
    this.sprite = sprite;
    debugMode = true;
    size = Vector2(100, 100);
    position = Vector2(300, -200);
    add(RectangleHitbox());
  }
  @override
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    y += 5.7;

    if (y > 680) {
      y = 0;
      x = random.nextInt(703) + 330 as double;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    if (other is Elf) {
      x = random.nextInt(703) + 330 as double;
      y = -200;
      if (gameRef.playerData.score.value > 0) {
        gameRef.playerData.score.value -= 1;
      }
      AudioManager.playSfx('hit.wav');
    }
  }
}
