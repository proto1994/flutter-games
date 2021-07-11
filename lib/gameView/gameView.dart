import 'package:flutter/material.dart';
import "dart:math";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './gameCube.dart';
import './score.dart';
import '../Widgets/shadowSquare.dart';
import '../controller/constants.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  Widget renderLeft(demoSquare) {
    return Container(
      height: 524.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var square in demoSquare)
            ShadowSquare(
              squares: square,
              color: Colors.white,
              width: 30,
              height: 30,
              opacity: 0.0,
              padding: EdgeInsets.all(5.w),
              margin: EdgeInsets.all(3.w),
            ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.w, top: 60.w),
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      // decoration: BoxDecoration(color: Colors.red),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          renderLeft(demoSquareLeft),
          Container(
            width: 480.w,
            height: 524.w,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 10.w, color: Colors.white),
                right: BorderSide(width: 10.w, color: Colors.white),
                bottom: BorderSide(width: 10.w, color: Colors.white),
                top: BorderSide(width: 10.w, color: Colors.white),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 50.w),
            child: Container(
              color: Color.fromRGBO(158, 173, 134, 1),
              child: Row(
                children: [
                  GameCube(),
                  Expanded(
                    child: Score(),
                  ),
                ],
              ),
            ),
          ),
          renderLeft(demoSquareRight),
        ],
      ),
    );
  }
}
