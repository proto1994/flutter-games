import 'package:flutter/material.dart';
import '../controller/audio.dart';

class GameProvider with ChangeNotifier {
  int _gameIndex;
  int _gameLevel;
  bool _isStart;
  Audio bgm;
  GameProvider() {
    this._gameIndex = -1;
    this._gameLevel = 1;
    this._isStart = false;
    this.bgm = new Audio();
  }

  int get gameIndex => this._gameIndex;
  int get gameLevel => this._gameLevel;
  bool get isStart => this._isStart;

  toggleSwitch() {
    if (this.isGameOff()) {
      this.bgm.playStartAudio();
    } else {
      this._isStart = false;
      this.bgm.pause();
    }
    this._gameIndex = this._gameIndex == -1 ? 0 : -1;
    notifyListeners();
  }

  changeGame() {
    this.bgm.pause();
    if (this._gameIndex >= 2) return;
    this._gameIndex++;
    notifyListeners();
  }

  changeLevel() {
    if (this.isGameStart()) {
      this.changeGame();
    } else {
      if (this._gameLevel >= 2) return;
      this._gameLevel++;
      notifyListeners();
    }
  }

  startGame() {
    this._isStart = true;
    notifyListeners();
  }

  isGameOff() {
    return this._gameIndex == -1;
  }

  isGameStart() {
    return this._gameIndex == 0;
  }

  isGameSeletor() {
    return this._gameIndex > 0;
  }
}
