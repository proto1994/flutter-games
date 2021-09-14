import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/game.dart';
import '../components/shadowSquare.dart';

import '../constants/index.dart';

class GameSelector extends StatefulWidget {
  @override
  _SelectorState createState() => _SelectorState();
}

class _SelectorState extends State<GameSelector> {
  num aniSquareIndex = 0;
  Timer timer;
  @override
  void initState() {
    super.initState();
    this.timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        aniSquareIndex++;
        aniSquareIndex = aniSquareIndex % 3;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose anii---');
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Consumer<GameProvider>(
              builder: (ctx, game, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ShadowSquare(
                      squares: digitalMap[0],
                      opacity: 0,
                    ),
                    ShadowSquare(
                      squares: digitalMap[game.gameIndex],
                      opacity: 0,
                    ),
                  ],
                );
              },
            ),
          ),
          Consumer<GameProvider>(
            builder: (ctx, game, child) {
              return Container(
                child: ShadowSquare(
                  squares: aniSquareDemo[game.gameIndex - 1][aniSquareIndex],
                  opacity: 0,
                ),
              );
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Consumer<GameProvider>(
              builder: (ctx, game, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ShadowSquare(
                      squares: digitalMap[0],
                      opacity: 0,
                    ),
                    ShadowSquare(
                      squares: digitalMap[game.gameLevel],
                      opacity: 0,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
