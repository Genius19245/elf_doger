import 'dart:math';

import 'package:elf_doger/utils/audio_manager.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'elf.dart';
import 'game.dart';

final _random = Random();

class Gift extends SpriteComponent //
    with
        CollisionCallbacks,
        HasGameRef<MyGame> {
  Gift({super.sprite}) {
    debugMode = true;
    size = Vector2(150.0, 150.0);
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    _resetToRandomPosition();
  }

  @override
  void update(double dt) {
    super.update(dt);
    y += 8.5;
    if (y >= gameRef.size.y) {
      _resetToRandomPosition();
    }
  }

  void _resetToRandomPosition() {
    final halfWidth = size.x / 2;
    position = Vector2(
      halfWidth + (_random.nextDouble() * (gameRef.size.x - halfWidth)),
      -size.y,
    );
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Elf) {
      _resetToRandomPosition();
      gameRef.score.value++;
      AudioManager.playSfx('coin.mp3');
    }
  }
}
