import 'package:flutter/material.dart';
import '../controller/tetris.dart';

class Game with ChangeNotifier {
  Tetris tetris;
  Game() {
    print('初始化');
    this.tetris = new Tetris();
    this.tetris.start();
    // print(this.tetris.getGameSquares());
  }
  int get score => this.tetris.getScore();

  List<List<int>> get gameSquares {
    return this.tetris.getGameSquares();
  }

  List<List<int>> get nextSquares {
    return this.tetris.nextSquares;
  }

  down() {
    this.tetris.down(true);
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
    this.tetris.pause();
    notifyListeners();
  }
}
