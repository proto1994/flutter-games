import 'package:flutter/material.dart';
import 'dart:async';
import '../controller/tetris.dart';

class Game with ChangeNotifier {
  Tetris tetris;
  Timer timer;
  bool isPause;
  bool _loadingStatus;
  Game() {
    print('初始化');
    this.isPause = false;
    this._loadingStatus = true;
    this.tetris = new Tetris();
    this.tetris.playStart();
    // this.start();
    // print(this.tetris.getGameSquares());
  }
  int get score => this.tetris.getScore();

  bool get loadingStatus => this._loadingStatus;

  List<List<int>> get gameSquares {
    return this.tetris.getGameSquares();
  }

  List<List<int>> get nextSquares {
    return this.tetris.nextSquares;
  }

  start() {
    this.tetris.copyCurPointToGameSquares();
    this.timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (!this.isPause) {
        this.tetris.down();
        if (this.tetris.checkGameIsOver()) {
          timer.cancel();
          this.tetris.playStart();
        }
        notifyListeners();
      }
    });
  }

  down() {
    this.tetris.down();
    notifyListeners();
  }

  drop() {
    this.tetris.drop();
    notifyListeners();
  }

  left() {
    this.tetris.left();
    notifyListeners();
  }

  right() {
    this.tetris.right();
    notifyListeners();
  }

  rotate() {
    this.tetris.rotate();
    notifyListeners();
  }

  toggleSound() {
    if (!this._loadingStatus) {
      this.tetris.sound();
    } else {
      this.gameStart();
    }
    notifyListeners();
  }

  replay() {
    this._loadingStatus = true;
    this.timer.cancel();
    this.tetris.playStart();
    this.tetris.replay();
    notifyListeners();
  }

  pause() {
    if (!this._loadingStatus) {
      if (!this.isPause) {
        this.timer?.cancel();
        this.isPause = true;
      } else {
        this.isPause = false;
        this.start();
      }
    } else {
      this.gameStart();
    }

    notifyListeners();
  }

  gameStart() {
    if (this._loadingStatus) {
      this.start();
    }
    this._loadingStatus = false;
  }

  begin() {
    this._loadingStatus = false;
    this.tetris.replay();
    this.start();
    notifyListeners();
  }

  isGameOver() {
    return this.tetris.checkGameIsOver();
  }
}
