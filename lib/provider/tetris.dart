import 'package:flutter/material.dart';
import 'dart:async';
import '../controller/tetris.dart';

class TetrisProvider with ChangeNotifier {
  Tetris tetris;
  Timer timer;
  bool isPause;
  TetrisProvider() {
    print('初始化');
    this.isPause = false;
    this.tetris = new Tetris();
    // this.tetris.playStart();
    // this.start();
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
    this.timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (!this.isPause) {
        this.tetris.down();
        if (this.tetris.checkGameIsOver()) {
          timer.cancel();
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
    this.tetris.sound();
    notifyListeners();
  }

  replay() {
    this.timer.cancel();
    this.tetris.playStart();
    this.tetris.replay();
    notifyListeners();
  }

  pause() {
    this.timer?.cancel();
    this.isPause = true;
    notifyListeners();
  }

  isGameOver() {
    return this.tetris.checkGameIsOver();
  }
}
