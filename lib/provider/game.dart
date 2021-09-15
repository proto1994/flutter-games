import 'package:flutter/material.dart';
import '../controller/audio.dart';
import '../controller/game.dart';
import '../constants/enum.dart';

class GameProvider with ChangeNotifier {
  int _gameIndex;
  int _gameLevel;
  bool _isStart;
  bool _isGameOver;
  Audio bgm;
  Game gameInstance;
  GameProvider() {
    this._gameIndex = -1;
    this._gameLevel = 1;
    this._isStart = false;
    this._isGameOver = false;
    this.bgm = new Audio();
    this.gameInstance = new Game(1);
  }

  int get gameIndex => this._gameIndex;
  int get gameLevel => this._gameLevel;
  bool get isStart => this._isStart;
  bool get isGameOver => this._isGameOver;

  changeGame() {
    this.bgm.pause();
    if (this._gameIndex >= 1) return;
    this._gameIndex++;
    this.gameInstance = new Game(this._gameIndex);
    notifyListeners();
  }

  changeLevel(num index) {
    if (this._gameLevel >= 1) return;
    this._gameLevel += index;
    notifyListeners();
  }

  startGame() {
    this._isStart = true;
    this._isGameOver = false;
    print('${this._gameIndex} gameindex');
    this.gameInstance.start((EGameStatus gameStatus) {
      this.handleGameOver(gameStatus);
      notifyListeners();
    });
    notifyListeners();
  }

  handleGameOver(EGameStatus gameStatus) {
    if (gameStatus == EGameStatus.IsGameAniOver) {
      this._isStart = false;
    } else if (gameStatus == EGameStatus.IsGameOver) {
      this._isGameOver = true;
    } else if (gameStatus == EGameStatus.IsGameAning) {
      this._isGameOver = false;
    }
  }

  // 开关
  onOff() {
    if (this.isGameOff()) {
      this.bgm.playStartAudio();
    } else {
      this.gameInstance.onOff();
      this._isStart = false;
      this.bgm.pause();
    }
    this._gameIndex = this.isGameOff() ? 0 : -1;
    notifyListeners();
  }

  onPause() {
    if (this.isGameStart()) {
      this.changeGame();
      return;
    }

    if (this.isGameSeletor()) {
      this.startGame();
      return;
    }

    this.gameInstance.pause();
    notifyListeners();
  }

  onSound() {
    if (this.isGameStart()) {
      this.changeGame();
      return;
    }
    this.gameInstance.sound();
    notifyListeners();
  }

  onReset() {
    this.bgm.pause();
    this.bgm.playStartAudio();
    this._gameIndex = 0;
    this._gameLevel = 1;
    this._isStart = false;
    this.gameInstance.reset();
    notifyListeners();
  }

  onLeft() {
    if (this.isGameStart()) {
      this.changeGame();
      return;
    }
    this.gameInstance.left();
    notifyListeners();
  }

  onRight() {
    if (this.isGameStart()) {
      this.changeGame();
      return;
    }
    this.gameInstance.right();
    notifyListeners();
  }

  onDown() {
    if (this._isGameOver) {
      return;
    }
    if (this.isGameStart()) {
      this.changeGame();
      return;
    }
    if (this.isGameSeletor()) {
      this.changeLevel(-1);
      return;
    }

    this.gameInstance.down();
    notifyListeners();
  }

  onUp() {
    if (this._isGameOver) {
      return;
    }
    if (this.isGameStart()) {
      this.changeGame();
      return;
    }
    if (this.isGameSeletor()) {
      this.changeLevel(1);
      return;
    }
    this.gameInstance.up();
    notifyListeners();
  }

  onRotate() {
    if (this.isGameStart()) {
      this.changeGame();
      return;
    }
    if (this.isGameSeletor()) {
      this.changeGame();
      return;
    }

    this.gameInstance.rotate();
    notifyListeners();
  }

  List<List<int>> get gameSquares {
    return this.gameInstance.getGameSquares();
  }

  List<List<int>> get nextSquares {
    return this.gameInstance.getNextSquares();
  }

  num get score {
    return this.gameInstance.getScore();
  }

  isGameOff() {
    return this._gameIndex == -1;
  }

  isGameStart() {
    return this._gameIndex == 0;
  }

  isGameSeletor() {
    return this._gameIndex > 0 && !this._isStart;
  }
}
