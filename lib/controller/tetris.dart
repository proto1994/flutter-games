import 'dart:async';
import 'dart:math';
import 'package:flutter_tetris/controller/constants.dart';

import './square.dart';

class Tetris {
  List<List<int>> gameSquares;
  List<List<int>> nextSquares;
  List<List<int>> curSquares;
  Point curPoint;
  int rotateIndex;
  int suqareIndex;
  Tetris() {
    this.gameSquares = defaultGamePannel;
    this.nextSquares = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
    ];
    this.createCurSuqare();
  }

  clearPrevCurPoint() {
    int x = this.curPoint.x;
    int y = this.curPoint.y;
    for (int i = 0; i < this.curSquares.length; i++) {
      for (int j = 0; j < this.curSquares[i].length; j++) {
        if (this.checkNextCurIsVaild(i + x, j + y)) {
          this.gameSquares[i + x][j + y] = 0;
        }
      }
    }
  }

  checkNextCurIsVaild(x, y) {
    if (x >= this.gameSquares.length) return false;
    if (y >= this.gameSquares[0].length) return false;
    if (x < 0 || y < 0) return false;
    if (this.gameSquares[x][y] == 1) return false;
    return true;
  }

  canDoNextOperating(pos, squares) {
    int x = pos.x;
    int y = pos.y;
    for (int i = 0; i < squares.length; i++) {
      for (int j = 0; j < squares[i].length; j++) {
        if (squares[i][j] != 0) {
          if (!this.checkNextCurIsVaild(x + i, y + j)) return false;
        }
      }
    }
    return true;
  }

  copyCurPointToGameSquares() {
    int x = this.curPoint.x;
    int y = this.curPoint.y;
    for (int i = 0; i < this.curSquares.length; i++) {
      for (int j = 0; j < this.curSquares[i].length; j++) {
        if (this.checkNextCurIsVaild(i + x, j + y)) {
          this.gameSquares[i + x][j + y] = this.curSquares[i][j];
        }
      }
    }
  }

  getGameSquares() {
    return this.gameSquares;
  }

  checkCanRotate() {
    int tempRotateIndex = this.rotateIndex;
    tempRotateIndex++;
    if (tempRotateIndex == 4) tempRotateIndex = 0;
    var tempCurSquares = defaultSquare[this.suqareIndex][tempRotateIndex];
    return this.canDoNextOperating(this.curPoint, tempCurSquares);
  }

  rotate() {
    if (this.checkCanRotate()) {
      this.rotateIndex++;
      if (this.rotateIndex == 4) this.rotateIndex = 0;
      this.curSquares = defaultSquare[this.suqareIndex][this.rotateIndex];
      this.clearPrevCurPoint();
      this.copyCurPointToGameSquares();
    }
  }

  down() {
    Point nextCurPoint = this.curPoint + new Point(1, 0);
    if (this.canDoNextOperating(nextCurPoint, this.curSquares)) {
      this.clearPrevCurPoint();
      this.curPoint = nextCurPoint;
      this.copyCurPointToGameSquares();
      return true;
    }

    return false;
  }

  drop() {
    while (true) {
      if (!this.down()) break;
    }
  }

  canDown() {
    Point nextCurPoint = this.curPoint + new Point(1, 0);
    return this.canDoNextOperating(nextCurPoint, this.curSquares);
  }

  left() {
    Point nextCurPoint = this.curPoint - new Point(0, 1);
    if (this.canDoNextOperating(nextCurPoint, this.curSquares)) {
      this.clearPrevCurPoint();
      this.curPoint = nextCurPoint;
      this.copyCurPointToGameSquares();
    }
  }

  right() {
    Point nextCurPoint = this.curPoint + new Point(0, 1);
    if (this.canDoNextOperating(nextCurPoint, this.curSquares)) {
      this.clearPrevCurPoint();
      this.curPoint = nextCurPoint;
      this.copyCurPointToGameSquares();
    }
  }

  createCurSuqare() {
    this.curPoint = new Point(0, 5);
    this.rotateIndex = Random().nextInt(3);
    this.suqareIndex = Random().nextInt(7);
    this.curSquares = defaultSquare[this.suqareIndex][this.rotateIndex];
    print('${this.rotateIndex} - ${this.suqareIndex}');
  }

  fixCurSquareToGamePannel() {
    int x = this.curPoint.x;
    int y = this.curPoint.y;
    for (int i = 0; i < this.curSquares.length; i++) {
      for (int j = 0; j < this.curSquares[i].length; j++) {
        if (this.checkNextCurIsVaild(i + x, j + y) &&
            this.curSquares[i][j] == 2) {
          this.gameSquares[i + x][j + y] = 1;
        }
      }
    }
  }

  // 消行
  clearRow() {
    for (int i = this.gameSquares.length - 1; i >= 0; i--) {
      bool isNeedClear = true;
      for (int j = 0; j < this.gameSquares[i].length; j++) {
        if (this.gameSquares[i][j] != 1) {
          isNeedClear = false;
          break;
        }
      }
      if (isNeedClear) {
        for (int n = i; n > 0; n--) {
          for (int m = 0; m < this.gameSquares[n].length; m++) {
            this.gameSquares[n][m] = this.gameSquares[n - 1][m];
          }
        }
        i++;
      }
    }
  }

  start(cb) {
    this.copyCurPointToGameSquares();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      print('afterTimer=' + DateTime.now().toString());
      if (!this.down()) {
        this.fixCurSquareToGamePannel();
        this.clearRow();
        this.createCurSuqare();
        this.copyCurPointToGameSquares();
        cb();
      } else {
        cb();
      }
      // if (count >= 5) {
      //   //取消定时器，避免无限回调
      //   timer.cancel();
      //   timer = null;
      // }
    });
  }
}
