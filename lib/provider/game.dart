import 'package:flutter/material.dart';
import 'dart:async';
import '../controller/tetris.dart';

class Game with ChangeNotifier {
  Tetris tetris;
  Timer timer;
  bool isPause;
  Game() {
    print('初始化');
    this.isPause = false;
    this.tetris = new Tetris();
    this.start();
    // print(this.tetris.getGameSquares());
  }
  int get score => this.tetris.getScore();

  List<List<int>> get gameSquares {
    return this.tetris.getGameSquares();
  }

  List<List<int>> get nextSquares {
    return this.tetris.nextSquares;
  }

  start() {
    this.tetris.copyCurPointToGameSquares();
    this.timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!this.isPause) {
        this.tetris.down();
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
    this.tetris.sound();
    notifyListeners();
  }

  replay() {
    this.tetris.replay();

    notifyListeners();
  }

  pause() {
    print('pause');
    if (!this.isPause) {
      this.timer?.cancel();
      this.isPause = true;
    } else {
      this.isPause = false;
      this.start();
    }
    notifyListeners();
  }

  isGameOver() {
    return this.tetris.checkGameIsOver();
  }
}
