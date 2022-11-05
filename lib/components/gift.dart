import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'elf.dart';
import 'game.dart';

class Gift extends SpriteComponent with CollisionCallbacks, HasGameRef<MyGame> {
  final Random random = Random();
  Gift(Sprite? sprite) {
    this.sprite = sprite;
    debugMode = true;
    size = Vector2(150, 150);
    position = Vector2(270, -200);
    x = 100;
    add(RectangleHitbox());
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    y += 3.5;

    if (y > 680) {
      y = 0;
      x = random.nextInt(703) + 230 as double;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    if (other is Elf) {
      x = random.nextInt(703) + 230 as double;
      y = -200;
      gameRef.playerData.score.value += 1;
    }
  }
}
