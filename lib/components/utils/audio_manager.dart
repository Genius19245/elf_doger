import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';

class AudioManager {
  static final sfx = ValueNotifier(true);
  static final bgm = ValueNotifier(true);

  static void init() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll([
      'electric_movements.mp3',
      'zapping_through_the_finish.mp3',
      'energizer_cult.mp3',
      'never_still.mp3',
      'hit.mp3',
      'synth.mp3',
    ]);
  }

  static void playSfx(String file) {
    if (sfx.value) {
      FlameAudio.play(file);
    }
  }

  static void playBgm(String file, String file1) {
    if (bgm.value) {
      FlameAudio.bgm.play(file);
      FlameAudio.bgm.play(file1);
    }
  }
}

// synth.wav and neverstill.wav is best
