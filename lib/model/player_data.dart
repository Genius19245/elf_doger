import 'package:flutter/cupertino.dart';

class PlayerData {
  final score = ValueNotifier<int>(0);
  final size = ValueNotifier<double>(150);
  final health = ValueNotifier<int>(10);
  final mobile = ValueNotifier<int>(0);
}
