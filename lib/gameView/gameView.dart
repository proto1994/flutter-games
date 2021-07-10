import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './gameCube.dart';
import './score.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  Widget renderLeft() {
    return new Expanded(
      flex: 1,
      child: Container(),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50.w),
      padding: EdgeInsets.only(top: 50.w),
      // decoration: BoxDecoration(color: Colors.red),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          renderLeft(),
          Container(
            width: 560.w,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 10.w, color: Colors.white),
                right: BorderSide(width: 10.w, color: Colors.white),
                bottom: BorderSide(width: 10.w, color: Colors.white),
                top: BorderSide(width: 10.w, color: Colors.white),
              ),
            ),
            padding: EdgeInsets.all(70.w),
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
          renderLeft(),
        ],
      ),
    );
  }
}
