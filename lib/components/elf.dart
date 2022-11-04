import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Elf extends SpriteComponent with KeyboardHandler {
  int _haxisInput = 0;
  final double _speed = 300;
  final Vector2 _velocity = Vector2.zero();
  Elf({
    Sprite? sprite,
    Vector2? position,
    Vector2? size,
    double? x,
    double? y,
  }) : super(
          position: position,
          sprite: sprite,
          size: size,
        );
  @override
  void update(double dt) {
    _velocity.x = _haxisInput * _speed;
    position += _velocity * dt;

    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keyspressed) {
    _haxisInput = 0;
    _haxisInput += keyspressed.contains(LogicalKeyboardKey.arrowLeft) ? -1 : 0;
    _haxisInput += keyspressed.contains(LogicalKeyboardKey.arrowRight) ? 1 : 0;
    return true;
  }
}
