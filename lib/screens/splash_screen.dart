import 'package:elf_doger/screens/game_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/back.jpeg',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: FittedBox(
              child: SizedBox(
                width: 1280.0,
                height: 720.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/elf.png',
                        width: 300.0,
                        height: 300.0,
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        'Elf Dodger',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 48.0,
                          color: Colors.black,
                          shadows: [
                            const Shadow(
                              offset: Offset(0, 0),
                              color: Colors.white,
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48.0),
                      _PlayButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(GameScreen.route());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
class _PlayButton extends StatefulWidget {
  const _PlayButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<_PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<_PlayButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 70),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _controller.forward(),
      onTapCancel: () => _controller.reverse(),
      onTapUp: (_) {
        _controller.reverse().then((_) {
          widget.onPressed();
        });
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(0.0, 5.0),
              child: Material(
                color: Colors.red.shade700,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Transform.translate(
                offset: Offset(0.0, _controller.value * 5.0),
                child: child,
              );
            },
            child: Material(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              child: SizedBox(
                width: 200.0,
                height: 150.0,
                child: Center(
                  child: const Text(
                    'Play',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
