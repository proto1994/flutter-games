import './baseGame.dart';
import './tetris.dart';
import '../constants/typedef.dart';

class Game extends BaseGame {
  BaseGame gameInstance;
  Game(num gameIndex) {
    switch (gameIndex) {
      case 1:
        this.gameInstance = new Tetris();
        break;
      default:
        this.gameInstance = new Tetris();
        break;
    }
  }

  start(StartCb cb) {
    this.gameInstance.start(cb);
  }

  onOff() {
    this.gameInstance.onOff();
  }

  reset() {
    this.gameInstance.reset();
  }

  rotate() {
    this.gameInstance.rotate();
  }

  left() {
    this.gameInstance.left();
  }

  right() {
    this.gameInstance.right();
  }

  up() {
    this.gameInstance.up();
  }

  down() {
    this.gameInstance.down();
  }

  sound() {
    this.gameInstance.sound();
  }

  pause() {
    this.gameInstance.pause();
  }

  List<List<int>> getGameSquares() {
    return this.gameInstance.getGameSquares();
  }

  List<List<int>> getNextSquares() {
    return this.gameInstance.getNextSquares();
  }

  num getScore() {
    return this.gameInstance.getScore();
  }
}
