import 'package:flutter/material.dart';

class ShadowSquare extends StatelessWidget {
  final List<List<int>> squares;
  ShadowSquare({Key key, this.squares}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        for (var colunm in squares)
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
}
