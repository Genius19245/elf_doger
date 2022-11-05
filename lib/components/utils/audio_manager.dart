import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';

class AudioManager {
  static final sfx = ValueNotifier(true);
  static final bgm = ValueNotifier(true);

  static void init() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache
        .loadAll(['background_music.wav', 'energy.wav', 'synth.wav']);
  }

  static void playSfx(String file) {
    if (sfx.value) {
      FlameAudio.play(file);
    }
  }

  static void playBgm(String file) {
    if (bgm.value) {
      FlameAudio.bgm.play(file);
    }
  }
}
