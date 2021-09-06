import 'package:flutter/material.dart';
import 'package:flutter_tetris/provider/tetris.dart';
import 'package:provider/provider.dart';
import '../provider/game.dart';
import '../Widgets/shadowSquare.dart';

import './start/index.dart';

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
        child: Consumer2<GameProvider, TetrisProvider>(
          builder: (ctx, game, tetris, child) {
            if (game.isStart) {
              return new ShadowSquare(
                squares: tetris?.gameSquares,
              );
            }
            if (game.gameIndex == 0) {
              return Start();
            }
            return null;
          },
        ),
      ),
    );
  }
}
