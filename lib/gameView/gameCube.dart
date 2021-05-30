import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/game.dart';

class GameCube extends StatefulWidget {
  @override
  _GameCubeState createState() => _GameCubeState();
}

class _GameCubeState extends State<GameCube> {
  @override
  void initState() {
    super.initState();
  }

  Widget createCubes(List<List<int>> gameSquares) {
    return new Column(
      children: [
        for (var colunm in gameSquares)
          new Row(
            children: [
              for (var row in colunm)
                Opacity(
                  opacity: row == 0 ? 0.2 : 1,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.all(1),
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                )
            ],
          )
      ],
    );
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
      child: new Container(child: Consumer<Game>(builder: (ctx, game, child) {
        return this.createCubes(game.gameSquares);
      })),
    );
  }
}
