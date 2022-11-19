import 'package:elf_doger/components/game.dart' show MyGame;
import 'package:elf_doger/utils/audio_manager.dart';
import 'package:flame/game.dart' show GameWidget;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

final myGame = MyGame();

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const GameScreen(),
    );
  }

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void reassemble() {
    super.reassemble();
    AudioManager.stopMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/back.jpeg',
          fit: BoxFit.cover,
        ),
        GameWidget<MyGame>(
          game: myGame,
        ),
        if (!kIsWeb)
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0, bottom: 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _MobileInputButton(
                    delta: -2,
                    icon: Icons.arrow_left,
                  ),
                  const SizedBox(width: 32.0),
                  _MobileInputButton(
                    delta: 2,
                    icon: Icons.arrow_right,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

@immutable
class _MobileInputButton extends StatelessWidget {
  const _MobileInputButton({
    super.key,
    required this.delta,
    required this.icon,
  });

  final double delta;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        myGame.elf.xAxisInput = delta;
      },
      onTapUp: (_) {
        myGame.elf.xAxisInput = 0;
      },
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: Colors.grey.shade100.withOpacity(0.5),
          shadows: [
            BoxShadow(
              color: Colors.grey.shade100.withOpacity(0.3),
              blurRadius: 12.0,
              spreadRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Icon(
            icon,
            size: 64.0,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
