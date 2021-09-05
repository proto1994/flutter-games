import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShadowSquare extends StatelessWidget {
  final List<List<int>> squares;
  final Color color;
  final num width;
  final num height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double opacity;
  final double activeOpacity;
  ShadowSquare({
    Key key,
    this.squares,
    this.color = Colors.black,
    this.height = 18,
    this.width = 18,
    this.margin,
    this.padding,
    this.opacity = 0.1,
    this.activeOpacity = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        for (var colunm in squares)
          new Row(
            children: [
              for (var row in colunm)
                Opacity(
                  opacity: row == 0 ? this.opacity : this.activeOpacity,
                  child: Container(
                    padding: this.padding ?? EdgeInsets.all(3.w),
                    margin: this.margin ?? EdgeInsets.all(1.w),
                    width: this.width.w,
                    height: this.height.w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: this.color),
                    ),
                    child: Container(
                      color: this.color,
                    ),
                  ),
                )
            ],
          )
      ],
    );
  }
}
