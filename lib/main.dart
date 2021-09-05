import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/game.dart';
import './provider/start.dart';
import './provider/tetris.dart';

import './pages/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
        ChangeNotifierProvider(create: (_) => StartProvider()),
        ChangeNotifierProvider(create: (_) => TetrisProvider()),
      ],
      child: MaterialApp(
        title: '俄罗斯方块',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: SquareGames(title: '俄罗斯方块'),
      ),
    );
  }
}
