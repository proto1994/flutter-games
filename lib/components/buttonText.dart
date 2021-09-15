import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  ButtonText({
    Key key,
    this.color,
    this.width,
    this.height,
    this.text,
    this.margin,
  }) : super(key: key);

  final Color color;
  final double width;
  final double height;
  final String text;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: new Column(
        children: [
          Container(
            width: this.width,
            height: this.height,
            margin: const EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              // gradient: RadialGradient(
              //   //背景径向渐变
              //   colors: [this.color, Colors.white],
              //   center: Alignment.center,
              //   radius: .9,
              // ),
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
              boxShadow: [
                //阴影
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(1, 1),
                  blurRadius: 1,
                ),
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(-1, -1),
                  blurRadius: 1,
                ),
              ],
              color: this.color,
              borderRadius: BorderRadius.circular(this.width),
            ),
          ),
          Text(
            this.text,
            style: TextStyle(
              fontSize: 11,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
