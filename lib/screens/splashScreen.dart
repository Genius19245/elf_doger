import 'package:animated_button/animated_button.dart';
import 'package:elf_doger/screens/game_play.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/back.jpeg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/elf.png',
                  width: 200,
                  height: 200,
                ),
                Text(
                  'Elf Dodger',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 50,
                    color: Colors.black,
                    shadows: [
                      const Shadow(
                        blurRadius: 20,
                        offset: Offset(0, 0),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                AnimatedButton(
                  shadowDegree: ShadowDegree.light,
                  color: Colors.red,
                  height: 150,
                  width: 200,
                  enabled: true,
                  duration: 70,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => GamePlay()));
                  },
                  child: const Text(
                    'Play',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
