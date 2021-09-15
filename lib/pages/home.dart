import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/shadowSquare.dart';
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
            width: 440.w,
            height: 524.w,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 10.w, color: Colors.white),
                right: BorderSide(width: 10.w, color: Colors.white),
                bottom: BorderSide(width: 10.w, color: Colors.white),
                top: BorderSide(width: 10.w, color: Colors.white),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 49.w, vertical: 39.w),
            child: Container(
              padding: EdgeInsets.all(10.w),
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

  Widget renderTitle() {
    return Positioned(
      left: 275.w,
      top: 40.w,
      child: Container(
        color: Colors.red[400],
        width: 200.w,
        height: 50.w,
        child: Align(
          child: Text(
            'SUPER',
            style: TextStyle(
              fontSize: 40.w,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget renderFooter() {
    return Container(
      child: Image(
        image: AssetImage('assets/footer2.png'),
        width: 650.w,
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
        child: Stack(
          children: [
            Column(
              children: [
                renderPanel(),
                GameHandle(),
                renderFooter(),
              ],
            ),
            this.renderTitle(),
          ],
        ),
      ),
    );
  }
}
