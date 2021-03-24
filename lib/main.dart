import 'package:flutter/material.dart';

import './gameView/gameView.dart';
import './gameView/gameControl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '俄罗斯方块',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: '俄罗斯方块'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.yellow),
        child: Column(
          children: [
            new Expanded(
              child: new GameView(),
            ),
            Container(
              height: 300,
              child: new GameControl(),
            ),
          ],
        ));
  }
}
