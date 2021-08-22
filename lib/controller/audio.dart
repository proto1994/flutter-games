import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

const _SOUNDS = [
  'clean.mp3',
  'drop.mp3',
  'explosion.mp3',
  'move.mp3',
  'rotate.mp3',
  'start.mp3'
];

class Audio {
  Soundpool _pool;
  Map<String, int> _soundIds;
  bool mute = false;
  var bytes;
  Audio() {
    _pool = Soundpool(streamType: StreamType.music, maxStreams: 4);
    _soundIds = Map();
    createSoundIds();
  }

  createSoundIds() async {
    for (var value in _SOUNDS) {
      _soundIds[value] = await loadSoundId(value);
    }
  }

  loadSoundId(value) async {
    final data = await rootBundle.load('assets/$value');
    final playId = await _pool.load(data);
    return playId;
  }

  void _play(String name) {
    final soundId = _soundIds[name];
    if (soundId != null && !mute) {
      _pool.play(soundId);
    }
  }

  // 静音
  toggleMute() {
    this.mute = !this.mute;
  }

  playMoveAudio() {
    _play('move.mp3');
  }

  playDropAudio() {
    _play('drop.mp3');
  }

  playRotateAudio() {
    _play('rotate.mp3');
  }

  playStartAudio() async {
    final playId = await loadSoundId('start.mp3');
    _pool.play(playId);
  }

  playGameOverAudio() {
    _play('explosion.mp3');
  }

  playClearAudio() {
    _play('start.mp3');
  }
}
