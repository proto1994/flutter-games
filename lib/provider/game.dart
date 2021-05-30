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
  int _score = 0;
  int get score => _score;

  List<List<int>> get gameSquares {
    return this.tetris.getGameSquares();
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
