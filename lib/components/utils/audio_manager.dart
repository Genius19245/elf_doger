import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';

class AudioManager {
  static final sfx = ValueNotifier(true);
  static final bgm = ValueNotifier(true);

  static void init() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll([
      'electric_movements.wav',
      'zapping_through_the_finish.wav',
      'synth.wav',
      'energizer_cult.wav',
      'never_still.wav',
      'pow_pow_lazer.wav',
      'sirens_before_the_drop.wav',
      'hit.wav',
      'synth.wav',
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
