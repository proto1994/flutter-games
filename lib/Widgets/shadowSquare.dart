import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    width: 23.w,
                    height: 23.w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.black),
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
