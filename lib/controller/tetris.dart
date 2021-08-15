import 'dart:async';
import 'dart:math';

import 'package:flutter_tetris/controller/constants.dart';

import './audio.dart';

const List<int> SCORE_MAP = [0, 100, 300, 600, 900];

class Tetris {
  List<List<int>> gameSquares;
  List<List<int>> nextSquares;
  List<List<int>> curSquares;
  Point curPoint;
  Timer timer;
  int rotateIndex;
  int suqareIndex;
  int rotateNextIndex;
  int suqareNextIndex;
  int score;
  bool isDropDown = false;
  Audio bgm;
  Tetris() {
    this.gameSquares = this.getDefaultGameSquares();
    this.score = 0;
    this.bgm = new Audio();
    this.createNextSuqare();
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
    this.bgm.playRotateAudio();
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
    } else {
      this.renderGameWhenSquareWasDown();
    }

    return false;
  }

  drop() {
    this.isDropDown = true;
    while (true) {
      if (!this.down()) {
        this.bgm.playDropAudio();
        break;
      }
    }
  }

  canDown() {
    Point nextCurPoint = this.curPoint + new Point(1, 0);
    return this.canDoNextOperating(nextCurPoint, this.curSquares);
  }

  left() {
    this.bgm.playMoveAudio();
    Point nextCurPoint = this.curPoint - new Point(0, 1);
    if (this.canDoNextOperating(nextCurPoint, this.curSquares)) {
      this.clearPrevCurPoint();
      this.curPoint = nextCurPoint;
      this.copyCurPointToGameSquares();
    }
  }

  right() {
    this.bgm.playMoveAudio();
    Point nextCurPoint = this.curPoint + new Point(0, 1);
    if (this.canDoNextOperating(nextCurPoint, this.curSquares)) {
      this.clearPrevCurPoint();
      this.curPoint = nextCurPoint;
      this.copyCurPointToGameSquares();
    }
  }

  createCurSuqare() {
    this.curPoint = new Point(0, 5);
    this.rotateIndex = this.rotateNextIndex;
    this.suqareIndex = this.suqareNextIndex;
    this.curSquares = this.nextSquares;
    this.createNextSuqare();
  }

  createNextSuqare() {
    this.curPoint = new Point(0, 5);
    this.rotateNextIndex = Random().nextInt(3);
    this.suqareNextIndex = Random().nextInt(7);
    this.nextSquares =
        defaultSquare[this.suqareNextIndex][this.rotateNextIndex];
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
    bool hasRowFullSuqare = false;
    int needClearSquashRowCount = 0;
    for (int i = this.gameSquares.length - 1; i >= 0; i--) {
      bool isNeedClear = true;
      for (int j = 0; j < this.gameSquares[i].length; j++) {
        if (this.gameSquares[i][j] != 1) {
          isNeedClear = false;
          break;
        }
      }
      if (isNeedClear) {
        hasRowFullSuqare = true;
        needClearSquashRowCount++;
        for (int n = i; n > 0; n--) {
          for (int m = 0; m < this.gameSquares[n].length; m++) {
            this.gameSquares[n][m] = this.gameSquares[n - 1][m];
          }
        }
        i++;
      }
    }
    print("$needClearSquashRowCount, needClearSquashRow");
    this.calcScore(needClearSquashRowCount);
    return hasRowFullSuqare;
  }

  calcScore(needClearSquashRowCount) {
    this.score += SCORE_MAP[needClearSquashRowCount];

    print(this.score);
  }

  checkGameIsOver() {
    return this.gameSquares[0].contains(1);
  }

  renderGameWhenSquareWasDown() {
    if (this.checkGameIsOver()) {
      this.bgm.playGameOverAudio();
      // timer.cancel();
      return;
    }
    this.fixCurSquareToGamePannel();
    if (this.clearRow()) {
      this.bgm.playClearAudio();
    } else {
      if (!this.isDropDown) {
        this.bgm.playDropAudio();
      }
      this.isDropDown = false;
    }
    this.createCurSuqare();
    this.copyCurPointToGameSquares();
  }

  sound() {
    this.bgm.toggleMute();
  }

  List<List<int>> getDefaultGameSquares() {
    List<List<int>> result = new List.generate(
      defaultGamePannel.length,
      (_) => new List(defaultGamePannel[0].length),
    );
    for (int i = 0; i < defaultGamePannel.length; i++) {
      for (int j = 0; j < defaultGamePannel[i].length; j++) {
        result[i][j] = defaultGamePannel[i][j];
      }
    }
    return result;
  }

  replay() {
    this.gameSquares = this.getDefaultGameSquares();
    this.createNextSuqare();
    this.createCurSuqare();
    this.copyCurPointToGameSquares();
    this.score = 0;
  }

  getScore() {
    return this.score;
  }

  playStart() {
    this.bgm.playStartAudio();
  }
}
