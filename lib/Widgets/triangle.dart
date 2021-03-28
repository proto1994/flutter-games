import 'package:flutter/material.dart';

class Triangle extends StatelessWidget {
  Triangle({
    Key key,
    this.direction,
  }) : super(key: key);

  final String direction;

  Widget build(BuildContext context) {
    return Container(
      width: 0,
      height: 0,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 8,
            color: Color(this.direction != 'left' ? 0x00 : 0xff000000),
          ),
          right: BorderSide(
            width: 8,
            color: Color(this.direction != 'right' ? 0x00 : 0xff000000),
          ),
          bottom: BorderSide(
            width: 8,
            color: Color(this.direction != 'bottom' ? 0x00 : 0xff000000),
          ),
          top: BorderSide(
            width: 8,
            color: Color(this.direction != 'top' ? 0x00 : 0xff000000),
          ),
        ),
      ),
    );
  }
}
