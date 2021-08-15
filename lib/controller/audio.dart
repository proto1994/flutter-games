import 'package:audioplayers/audioplayers.dart';

class Audio {
  AudioCache audioPlayer;
  bool mute = false;
  Audio() {
    this.audioPlayer = AudioCache(prefix: 'assets/');
    this.audioPlayer.loadAll([
      'clean.mp3',
      'drop.mp3',
      'explosion.mp3',
      'rotate.mp3',
      'start.mp3',
      'move.mp3',
    ]);
  }

  // play() async {
  //   int result = await audioPlayer.play('music.mp3', isLocal: true);
  //   if (result == 1) {
  //     // succes
  //   }
  // }

  // 静音
  toggleMute() {
    this.mute = !this.mute;
  }

  playMoveAudio() {
    if (this.mute) return;
    // await audioPlayer.seek(Duration(milliseconds: 3000));
    this.audioPlayer?.play('move.mp3');
  }

  playDropAudio() {
    if (this.mute) return;
    this.audioPlayer?.play('drop.mp3');
  }

  playRotateAudio() {
    if (this.mute) return;
    this.audioPlayer?.play('rotate.mp3');
  }

  playStartAudio() {
    if (this.mute) return;
    this.audioPlayer?.play('start.mp3');
  }

  playGameOverAudio() {
    if (this.mute) return;
    this.audioPlayer?.play('explosion.mp3');
  }

  playClearAudio() {
    if (this.mute) return;
    this.audioPlayer?.play('start.mp3');
  }
}
