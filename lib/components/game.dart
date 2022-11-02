import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MyGame extends FlameGame with KeyboardEvents, HasCollisionDetection {
  // variables
  double y = 150;
  // players
  SpriteComponent player = SpriteComponent();
  SpriteComponent gift = SpriteComponent();
  SpriteComponent stone1 = SpriteComponent();

  final Random random = Random();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(SpriteComponent()
      ..sprite = await loadSprite('road.png')
      ..size = size);
    add(player
      ..sprite = await loadSprite('elf.png')
      ..x = 150
      ..y = 150
      ..size = Vector2(150, 150)
      ..debugMode = true);

    add(gift
      ..sprite = await loadSprite('gift.png')
      ..x = 600
      ..y = 150
      ..size = Vector2(150, 150));
    add(Stone(await loadSprite('stone.png')));
    add(Stone1(await loadSprite('stone.png')));

    //add(Spawner(stone, random));

    // add(Player(
    //     await loadSprite('elf.png'),
    //     Vector2(x, y)
    //       ..x = 67
    //       ..y = 125));
  }

  @override
  void update(dt) {
    super.update(dt);
    gift.y += 1;
    y += 1;
    if (player.x > 730) {
      player.x -= 20;
    }
    if (player.x < 230) {
      player.x += 20;
    }
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      player.x -= 10.0;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      player.x += 10.0;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      player.y -= 10.0;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      player.y += 10.0;
    }
    return KeyEventResult.handled;
  }
}
//
// class Player extends SpriteComponent {
//   Player(Sprite sprite, Vector2? positions) {
//     this.sprite = sprite;
//     anchor = Anchor.center;
//     size = Vector2(75, 75);
//     position = positions!;
//   }
// }

// class Spawner extends TimerComponent with HasGameRef<MyGame> {
//   final Random random;
//
//   final SpriteComponent stone;
//
//   Spawner(
//     this.stone,
//     this.random,
//   ) : super(
//           period: 0.05,
//           repeat: true,
//         );
//
//   @override
//   void onTick() {
//     gameRef.addAll(
//       List.generate(
//         5,
//         (index) => stone,
//       ),
//     );
//   }
// }

// class Bottom extends SpriteComponent with CollisionCallbacks {
//   Bottom(Sprite sprite) {
//     this.sprite = sprite;
//     position = Vector2(100, 600);
//     size = Vector2(100, 100);
//     debugMode = true;
//     anchor = Anchor.center;
//   }
//   @override
//   void onCollisionStart(
//       Set<Vector2> intersectionPoints, PositionComponent other) {
//     // TODO: implement onCollisionStart
//     super.onCollisionStart(intersectionPoints, other);
//     if (other is Bottom) {
//       print('collision');
//     }
//   }
// }

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
