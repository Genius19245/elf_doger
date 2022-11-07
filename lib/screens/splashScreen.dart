import 'package:elf_doger/main.dart';
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const GamePlay()));
                  },
                  child: const Text(
                    'Play',
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
