import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provider/game.dart';
import '../Widgets/shadowSquare.dart';

import './openAnimation.dart';

class GamePanel extends StatefulWidget {
  @override
  _GameCubeState createState() => _GameCubeState();
}

class _GameCubeState extends State<GamePanel> {
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
          if (game.loadingStatus) {
            return OpenAnimation();
          }

          if (game.isGameOver()) {
            return OpenAnimation();
          }
          return new ShadowSquare(
            squares: game?.gameSquares,
          );
        }),
      ),
    );
  }
}
