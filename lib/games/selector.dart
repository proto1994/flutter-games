import 'package:flutter/material.dart';
import 'package:flutter_tetris/provider/tetris.dart';
import 'package:provider/provider.dart';
import '../provider/game.dart';
import '../Widgets/shadowSquare.dart';

class GameSelector extends StatefulWidget {
  @override
  _SelectorState createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
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
      child: null,
    );
  }
}
