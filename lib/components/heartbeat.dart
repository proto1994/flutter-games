import 'package:flutter/material.dart';

class Heartbeat extends StatefulWidget {
  final Widget child;
  Heartbeat({
    Key key,
    this.child,
  }) : super(key: key);
  _HeartbeatState createState() => _HeartbeatState();
}

class _HeartbeatState extends State<Heartbeat>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);
    //图片宽高从0变到300
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
    //启动动画(正向执行)
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: widget.child,
    );
  }
}
