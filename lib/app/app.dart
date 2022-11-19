import 'package:elf_doger/screens/splash_screen.dart';
import 'package:flutter/material.dart';

@immutable
class ElfDodgerApp extends StatelessWidget {
  const ElfDodgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: SplashScreen(),
    );
  }
}
