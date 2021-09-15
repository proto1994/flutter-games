import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/shadowSquare.dart';
import '../components/heartbeat.dart';
import '../provider/game.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScorePanel extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<ScorePanel> {
  Widget renderLine(text, score) {
    return new Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: new Text(
                text,
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(17, 17, 17, 1),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: new Text(
                score.toString(),
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(17, 17, 17, 1),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 6.w,
        right: 6.w,
        top: 10.w,
      ),
      child: Consumer<GameProvider>(
        builder: (ctx, game, child) {
          // if (game.isGameOff()) {
          //   return Container(child: null);
          // }
          return new Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.w),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '${game.score}',
                    style: TextStyle(
                      fontSize: 25.w,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.w),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'HI-SCORE',
                    style: TextStyle(
                      fontSize: 12.w,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 80.w,
                margin: EdgeInsets.only(bottom: 20.w),
                child: ShadowSquare(
                  squares: game.nextSquares,
                  opacity: 0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.w),
                child: Align(
                  child: Text(
                    '11',
                    style: TextStyle(
                      fontSize: 30.w,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 20.w,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.w),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'SPEED LEVEL',
                    style: TextStyle(
                      fontSize: 12.w,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 80.w,
                // color: Colors.black,
                margin: EdgeInsets.only(bottom: 20.w),
                child: null,
              ),
              Container(
                child: Heartbeat(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'GAME OVER',
                      style: TextStyle(
                        fontSize: 12.w,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
