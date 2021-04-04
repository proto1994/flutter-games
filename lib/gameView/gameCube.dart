import 'package:flutter/material.dart';
import '../controller/tetris.dart';
import '../utils/eventBus.dart';

class GameCube extends StatefulWidget {
  @override
  _GameCubeState createState() => _GameCubeState();
}

class _GameCubeState extends State<GameCube> {
  Tetris tetris;

  @override
  void initState() {
    super.initState();
    this.tetris = new Tetris();
    this.tetris.start();

    eventBus.on('tetris', (type) {
      print(type);
      switch (type) {
        case 'down':
          this.tetris.down();
          break;
        case 'left':
          this.tetris.left();
          break;
        case 'right':
          this.tetris.right();
          break;
        default:
          break;
      }
      this.setState(() {
        print('强制更新');
      });
    });
  }

  Widget createCubes() {
    return new Column(
      children: [
        for (var colunm in this.tetris.getGameSquares())
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
      child: new Container(
        child: this.createCubes(),
      ),
    );
  }
}
