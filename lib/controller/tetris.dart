import 'dart:math';

class Tetris {
  List<List<int>> gameSquares;
  List<List<int>> nextSquares;
  List<List<int>> curSquares;
  Point curPoint;
  Tetris() {
    this.gameSquares = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ];
    this.nextSquares = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
    ];
    this.curSquares = [
      [0, 1, 0, 0],
      [0, 1, 0, 0],
      [0, 1, 0, 0],
      [0, 1, 0, 0],
    ];
    this.curPoint = new Point(10, 5);
  }

  clearPrevCurPoint() {
    int x = this.curPoint.x;
    int y = this.curPoint.y;
    for (int i = 0; i < this.curSquares.length; i++) {
      for (int j = 0; j < this.curSquares[i].length; j++) {
        this.gameSquares[i + x][j + y] = 0;
      }
    }
  }

  copyCurPointToGameSquares() {
    int x = this.curPoint.x;
    int y = this.curPoint.y;
    for (int i = 0; i < this.curSquares.length; i++) {
      for (int j = 0; j < this.curSquares[i].length; j++) {
        this.gameSquares[i + x][j + y] = this.curSquares[i][j];
      }
    }
  }

  getGameSquares() {
    return this.gameSquares;
  }

  down() {
    this.clearPrevCurPoint();
    this.curPoint += new Point(1, 0);
    this.copyCurPointToGameSquares();
  }

  left() {
    this.clearPrevCurPoint();
    this.curPoint -= new Point(0, 1);
    this.copyCurPointToGameSquares();
  }

  right() {
    this.clearPrevCurPoint();
    this.curPoint += new Point(0, 1);
    this.copyCurPointToGameSquares();
  }

  start() {
    this.copyCurPointToGameSquares();
  }
}
