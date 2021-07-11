import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provider/game.dart';
import '../Widgets/shadowSquare.dart';

class GameCube extends StatefulWidget {
  @override
  _GameCubeState createState() => _GameCubeState();
}

class _GameCubeState extends State<GameCube> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: new Container(
        child: Consumer<Game>(builder: (ctx, game, child) {
          if (game.isGameOver()) {
            return Text(
              'game Over',
              style: TextStyle(
                fontSize: 20.w,
              ),
            );
          }
          return new ShadowSquare(
            squares: game?.gameSquares,
          );
        }),
      ),
    );
  }
}
