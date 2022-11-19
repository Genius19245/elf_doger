import 'package:elf_doger/components/game.dart';
import 'package:elf_doger/components/stone.dart';
import 'package:elf_doger/components/stone1.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class Elf extends SpriteComponent
    with KeyboardHandler, CollisionCallbacks, HasGameRef<MyGame> {
  int _haxisInput = 0;
  final double _speed = 300;
  final Vector2 _velocity = Vector2.zero();

  Elf({Sprite? sprite, Vector2? position, Vector2? size, double? x, double? y})
      : super(
          position: position,
          sprite: sprite,
          size: size,
        ) {
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    _velocity.x = _haxisInput * _speed;
    position += _velocity * dt;
    if (x > 1200) {
      x = -1;
    }
    if (x < -1) {
      x = 1200;
    }
    if (gameRef.playerData.mobile.value > 0) {
      x += 10;
    }
    if (gameRef.playerData.mobile.value < 0) {
      x -= 10;
    }

    super.update(dt);
  }

  @override
  Future<void>? add(Component component) {
    // TODO: implement add
    return super.add(RectangleHitbox());
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _haxisInput = 0;
    _haxisInput += keysPressed.contains(LogicalKeyboardKey.arrowLeft) ? -2 : 0;
    _haxisInput += keysPressed.contains(LogicalKeyboardKey.arrowRight) ? 2 : 0;
    return true;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    if (other is Stone && isColliding || other is Stone1 && isColliding) {}
  }
}
// this is the game character,
