import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'elf.dart';

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection, PanDetector {
  Offset? _pointerStarterPosition;
  late Elf elf;
  // variables
  double y = 150;
  // players
  SpriteComponent player = SpriteComponent();
  SpriteComponent gift = SpriteComponent();
  SpriteComponent stone1 = SpriteComponent();
  TextComponent score = TextComponent();
  final Random random = Random();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(SpriteComponent()
      ..sprite = await loadSprite('road.png')
      ..size = size);

    elf = Elf();
    //
    // add(gift
    //   ..sprite = await loadSprite('gift.png')
    //   ..x = 600
    //   ..y = 150
    //   ..size = Vector2(150, 150));
    add(Stone(await loadSprite('stone.png')));
    add(Stone1(await loadSprite('stone.png')));
    add(Elf(
      sprite: await loadSprite('elf.png'),
      position: Vector2(300, 150),
      size: Vector2(100.5, 100.5),
    ));
  }

  @override
  void update(dt) {
    super.update(dt);
    // for score component
  }
}

class Stone extends SpriteComponent with CollisionCallbacks {
  final Random random = Random();

  Stone(Sprite sprite) {
    this.sprite = sprite;
    debugMode = true;
    size = Vector2(100, 100);
    position = Vector2(300, 0);
  }
  @override
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    y += 1.2;

    if (y > 680) {
      y = 0;
      x = random.nextInt(703) + 330 as double;
    }
  }
}

class Stone1 extends SpriteComponent with CollisionCallbacks {
  final Random random = Random();

  Stone1(Sprite sprite) {
    this.sprite = sprite;
    debugMode = true;
    size = Vector2(150, 150);
    position = Vector2(270, 0);
    x = 300;
  }
  @override
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    y += 1.5;

    if (y > 680) {
      y = 0;
      x = random.nextInt(703) + 230 as double;
    }
  }
}
