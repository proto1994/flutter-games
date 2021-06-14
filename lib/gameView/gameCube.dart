import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      width: 152,
      height: 302,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: new Container(
        child: Consumer<Game>(builder: (ctx, game, child) {
          return new ShadowSquare(
            squares: game?.gameSquares,
          );
        }),
      ),
    );
  }
}
