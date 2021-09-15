import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/game.dart';
import '../components/shadowSquare.dart';

import './start/index.dart';
import './selector.dart';

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
      width: 206.w,
      height: 406.w,
      padding: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.black, style: BorderStyle.solid),
          top: BorderSide(color: Colors.black, style: BorderStyle.solid),
          bottom: BorderSide(color: Colors.black, style: BorderStyle.solid),
        ),
      ),
      child: new Container(
        child: Consumer<GameProvider>(
          builder: (ctx, game, child) {
            if (game.isStart) {
              switch (game.gameIndex) {
                case 1:
                  return new ShadowSquare(
                    squares: game?.gameSquares,
                  );
              }
            }

            if (game.gameIndex == -1) {
              return Container(child: null);
            }
            if (game.gameIndex == 0) {
              return Start();
            }
            return new GameSelector();
          },
        ),
      ),
    );
  }
}
