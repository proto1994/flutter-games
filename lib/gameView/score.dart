import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/game.dart';

class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
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
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Consumer<Game>(builder: (ctx, game, child) {
          return renderLine('最高分', game.score);
        }),
        renderLine('消除行', 4),
        renderLine('级别', 1),
        renderLine('下一个', 2),
      ],
    );
  }
}
