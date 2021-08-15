import 'package:flutter/material.dart';
import 'dart:async';
import '../constants/index.dart';
import '../Widgets/shadowSquare.dart';

class OpenAnimation extends StatefulWidget {
  @override
  _OpenAnimationState createState() => _OpenAnimationState();
}

class _OpenAnimationState extends State<OpenAnimation> {
  List<List<int>> square = [];
  int circleCount = 0;
  int row = 0;
  int column = 19;
  Timer timer;
  String direction = 'r'; // r t l b

  double opacity = 0;
  double activeOpacity = 1;
  int secondaryCount = 0;
  int fourCount = 0;

  List<List<int>> getDefaultGameSquares() {
    List<List<int>> result = new List.generate(
      animationDefaultSquare.length,
      (_) => new List(animationDefaultSquare[0].length),
    );
    for (int i = 0; i < animationDefaultSquare.length; i++) {
      for (int j = 0; j < animationDefaultSquare[i].length; j++) {
        result[i][j] = animationDefaultSquare[i][j];
      }
    }
    return result;
  }

  initState() {
    super.initState();
    square = getDefaultGameSquares();
    this.stepFirst();
  }

  stepFirst() {
    row = 0;
    column = 19;
    direction = 'r';
    circleCount = 0;
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      print('first----');
      if (column == 14 && row == 4) {
        timer.cancel();
        stepSecondary();
      }
      square[column][row] = square[column][row] == 1 ? 0 : 1;
      this.setState(() {
        square = square;
      });
      if (direction == 'r') {
        if (row < (9 - circleCount)) {
          row++;
        } else {
          direction = 't';
        }
      }
      if (direction == 't') {
        if (column > circleCount) {
          column--;
        } else {
          direction = 'l';
        }
      }
      if (direction == 'l') {
        if (row > circleCount) {
          row--;
        } else {
          direction = 'b';
        }
      }
      if (direction == 'b') {
        if (column < (18 - circleCount)) {
          column++;
        }
        if (column == (18 - circleCount)) {
          direction = 'r';
          circleCount++;
        }
      }
    });
  }

  stepSecondary() {
    timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      secondaryCount++;
      Timer(
        const Duration(milliseconds: 500),
        () {
          this.setState(() {
            opacity = 1;
          });
        },
      );
      Timer(
        const Duration(milliseconds: 1000),
        () {
          this.setState(() {
            opacity = 0;
          });
          if (secondaryCount == 4) {
            timer.cancel();
            stepThree();
          }
        },
      );
    });
  }

  stepThree() {
    row = 0;
    column = 19;
    direction = 'r';
    circleCount = 0;
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (column == 14 && row == 4) {
        timer.cancel();
        stepFour();
      }
      square[column][row] = square[column][row] == 1 ? 0 : 1;
      this.setState(() {
        square = square;
      });
      if (direction == 'r') {
        if (row < (9 - circleCount)) {
          row++;
        } else {
          direction = 't';
        }
      }
      if (direction == 't') {
        if (column > circleCount) {
          column--;
        } else {
          direction = 'l';
        }
      }
      if (direction == 'l') {
        if (row > circleCount) {
          row--;
        } else {
          direction = 'b';
        }
      }
      if (direction == 'b') {
        if (column < (18 - circleCount)) {
          column++;
        }
        if (column == (18 - circleCount)) {
          direction = 'r';
          circleCount++;
        }
      }
    });
  }

  stepFour() {
    timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      fourCount++;
      Timer(
        const Duration(milliseconds: 500),
        () {
          this.setState(() {
            opacity = 0;
            activeOpacity = 0;
          });
        },
      );
      Timer(
        const Duration(milliseconds: 1000),
        () {
          this.setState(() {
            opacity = 0;
            activeOpacity = 1;
          });
          if (fourCount == 4) {
            timer.cancel();
            stepFirst();
          }
        },
      );
    });
  }

  @override
  dispose() {
    print('dispose');
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ShadowSquare(
        squares: square,
        opacity: opacity,
        activeOpacity: activeOpacity,
      ),
    );
  }
}
