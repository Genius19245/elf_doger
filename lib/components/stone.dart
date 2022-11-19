import 'dart:math';

import 'package:elf_doger/components/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'elf.dart';

final _random = Random();

enum StoneType {
  small(8.5, x: 72.0, y: 98.0),
  large(9.7, x: 121.0, y: 164.0);

  const StoneType(
    this.fallSpeed, {
    required this.x,
    required this.y,
  });

  final double fallSpeed;
  final double x;
  final double y;
}

class Stone extends SpriteComponent //
    with
        CollisionCallbacks,
        HasGameRef<MyGame> {
  Stone(this.type, {super.sprite}) {
    debugMode = true;
    anchor = Anchor.center;
    size = Vector2(type.x, type.y);
    add(RectangleHitbox());
  }

  final StoneType type;

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    _resetToRandomPosition();
  }

  @override
  void update(double dt) {
    super.update(dt);
    y += type.fallSpeed;
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
      other.hitByStone();
    }
  }
}
