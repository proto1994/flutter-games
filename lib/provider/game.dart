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

  changeLevel(num index) {
    if (this._gameLevel >= 2) return;
    this._gameLevel += index;
    notifyListeners();
  }

  startGame() {
    this._isStart = true;
    notifyListeners();
  }

  onSwitch() {
    this.toggleSwitch();
  }

  onPause() {
    if (this.isGameStart()) {
      this.changeGame();
    }
  }

  onSound() {
    if (this.isGameStart()) {
      this.changeGame();
    }
  }

  onReset() {
    if (this.isGameStart()) {
      this.changeGame();
    }
  }

  onLeft() {
    if (this.isGameStart()) {
      this.changeGame();
    }
  }

  onRight() {
    if (this.isGameStart()) {
      this.changeGame();
    }
  }

  onDown() {
    if (this.isGameStart()) {
      this.changeGame();
      return;
    }
    if (this.isGameSeletor()) {
      this.changeLevel(-1);
      return;
    }
  }

  onUp() {
    if (this.isGameStart()) {
      this.changeGame();
      return;
    }
    if (this.isGameSeletor()) {
      this.changeLevel(1);
      return;
    }
  }

  onRotate() {
    if (this.isGameStart()) {
      this.changeGame();
    }

    if (this.isGameSeletor()) {
      this.changeGame();
      return;
    }
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
