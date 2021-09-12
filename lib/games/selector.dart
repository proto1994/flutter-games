import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
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
          Container(
            child: ShadowSquare(
              squares: tetrisDemoSquare,
              opacity: 0,
            ),
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
