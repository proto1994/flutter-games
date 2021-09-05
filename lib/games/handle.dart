import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Widgets/buttonText.dart';
import '../Widgets/triangle.dart';
import '../provider/tetris.dart';

class GameHandle extends StatefulWidget {
  @override
  _GameControlState createState() => _GameControlState();
}

class _GameControlState extends State<GameHandle> {
  Widget renderControl() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.w),
      padding: EdgeInsets.only(left: 100.w, right: 100.w),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<TetrisProvider>(builder: (ctx, game, child) {
            return renderControlBtn(
              text: '暂停',
              onTap: () {
                print('点击暂停');
                game.pause();
              },
            );
          }),
          Consumer<TetrisProvider>(builder: (ctx, game, child) {
            return renderControlBtn(
              text: '音效',
              onTap: () {
                print('点击音效');
                game.toggleSound();
              },
            );
          }),
          Consumer<TetrisProvider>(builder: (ctx, game, child) {
            return renderControlBtn(
              text: '重玩',
              onTap: () {
                print('点击重玩');
                game.replay();
              },
            );
          }),
          Consumer<TetrisProvider>(builder: (ctx, game, child) {
            return renderControlBtn(
              text: '开始',
              onTap: () {
                print('点击重玩');
                game.begin();
              },
            );
          }),
        ],
      ),
    );
  }

  Widget renderControlBtn({text, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: new ButtonText(
        width: 60.w,
        height: 60.w,
        color: Colors.yellow[400],
        text: text,
        margin: EdgeInsets.only(right: 30.w),
      ),
    );
  }

  Widget renderDrop() {
    return Consumer<TetrisProvider>(
      builder: (ctx, game, child) {
        return GestureDetector(
          onTap: () {
            print('点击旋转');
            game.rotate();
          },
          child: Container(
            child: new ButtonText(
              width: 150.w,
              height: 150.w,
              color: Colors.yellow[400],
              text: '旋转',
            ),
          ),
        );
      },
    );
  }

  Widget renderTriangle() {
    return new Container(
      width: 60.w,
      height: 60.w,
      child: new Stack(
        children: [
          Positioned(
            left: 30.w,
            top: 0.w,
            child: new Triangle(
              direction: 'top',
            ),
          ),
          Positioned(
            left: 0.w,
            top: 30.w,
            child: new Triangle(
              direction: 'left',
            ),
          ),
          Positioned(
            right: 0.w,
            top: 30.w,
            child: new Triangle(
              direction: 'right',
            ),
          ),
          Positioned(
            left: 30.w,
            bottom: 0.w,
            child: new Triangle(
              direction: 'bottom',
            ),
          ),
        ],
      ),
    );
  }

  Widget renderDirection() {
    return Container(
      width: 240.w,
      height: 240.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 80.w,
            top: 4.w,
            child: Consumer<TetrisProvider>(builder: (ctx, game, child) {
              return renderDirectionBtn(
                onTap: () {
                  game.drop();
                },
              );
            }),
          ),
          Positioned(
            left: 4.w,
            top: 80.w,
            child: Consumer<TetrisProvider>(
              builder: (ctx, game, child) {
                return renderDirectionBtn(
                  onTap: () {
                    print('点击左移');
                    game.left();
                  },
                );
              },
            ),
          ),
          Positioned(
            right: 4.w,
            top: 80.w,
            child: Consumer<TetrisProvider>(
              builder: (ctx, game, child) {
                return renderDirectionBtn(
                  onTap: () {
                    print('点击右移');
                    game.right();
                  },
                );
              },
            ),
          ),
          Positioned(
            top: 154.w,
            left: 80.w,
            child: Consumer<TetrisProvider>(builder: (ctx, game, child) {
              return renderDirectionBtn(
                onTap: () {
                  game.down();
                },
              );
            }),
          ),
          renderTriangle(),
        ],
      ),
    );
  }

  Widget renderDirectionBtn({onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: new ButtonText(
        width: 80.w,
        height: 80.w,
        color: Colors.yellow[400],
        text: '',
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60.w, top: 60.w, right: 60.w),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          renderControl(),
          Container(
            padding: EdgeInsets.only(left: 60.w, right: 60.w),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                renderDirection(),
                renderDrop(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
