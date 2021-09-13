import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/shadowSquare.dart';
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
          if (game.gameIndex == -1) {
            return Container(child: null);
          }
          return new Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer<GameProvider>(builder: (ctx, game, child) {
                return renderLine('最高分', 2);
              }),
              // renderLine('消除行', 4),
              // renderLine('级别', 1),
              // renderLine('下一个', 2),
              Consumer<GameProvider>(builder: (ctx, game, child) {
                return ShadowSquare(
                  squares: game.nextSquares,
                  opacity: 0,
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
