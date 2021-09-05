import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widgets/shadowSquare.dart';
import '../controller/constants.dart';

import '../games/handle.dart';

import '../games/gamePanel.dart';
import '../games/scorePanel.dart';

class SquareGames extends StatefulWidget {
  SquareGames({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SquareGamesState createState() => _SquareGamesState();
}

class _SquareGamesState extends State<SquareGames> {
  // 图案
  Widget renderPattern(demoSquare) {
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

  Widget renderPanel() {
    return Container(
      margin: EdgeInsets.only(bottom: 30.w, top: 60.w),
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      // decoration: BoxDecoration(color: Colors.red),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          renderPattern(demoSquareLeft),
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
                  GamePanel(),
                  Expanded(
                    child: ScorePanel(),
                  ),
                ],
              ),
            ),
          ),
          renderPattern(demoSquareRight),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(750, 1500),
      orientation: Orientation.portrait,
    );
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Colors.red[400]),
        child: Column(
          children: [
            renderPanel(),
            GameHandle(),
          ],
        ),
      ),
    );
  }
}
