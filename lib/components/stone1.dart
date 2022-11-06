import 'dart:math';

import 'package:elf_doger/components/game.dart';
import 'package:elf_doger/components/utils/audio_manager.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'elf.dart';

class Stone1 extends SpriteComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  final Random random = Random();

  Stone1(Sprite? sprite) {
    this.sprite = sprite;
    debugMode = true;
    size = Vector2(150, 150);
    position = Vector2(270, -100);
    x = 300;
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    y += 5.5;

    if (y > 680) {
      y = 0;
      x = random.nextInt(703) + 0 as double;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    if (other is Elf) {
      x = random.nextInt(703) + 0 as double;
      y = -100;
      gameRef.playerData.score.value -= 1;
      AudioManager.playSfx('hit.wav');
    }
  }
}
