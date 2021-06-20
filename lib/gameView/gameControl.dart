import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/buttonText.dart';
import '../Widgets/triangle.dart';
import '../provider/game.dart';

class GameControl extends StatefulWidget {
  @override
  _GameControlState createState() => _GameControlState();
}

class _GameControlState extends State<GameControl> {
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.yellow,
            child: new Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: new Row(
                    children: [
                      Consumer<Game>(builder: (ctx, game, child) {
                        return GestureDetector(
                          onTap: () {
                            print('点击暂停');
                            game.pause();
                          },
                          child: new ButtonText(
                            width: 30,
                            height: 30,
                            color: Color.fromRGBO(45, 196, 33, 1),
                            text: '暂停(P)',
                            margin: const EdgeInsets.only(right: 15),
                          ),
                        );
                      }),
                      Consumer<Game>(builder: (ctx, game, child) {
                        return GestureDetector(
                          onTap: () {
                            print('点击音效');
                            game.toggleSound();
                          },
                          child: new ButtonText(
                            width: 30,
                            height: 30,
                            color: Color.fromRGBO(45, 196, 33, 1),
                            text: '音效(S)',
                            margin: const EdgeInsets.only(right: 15),
                          ),
                        );
                      }),
                      Consumer<Game>(builder: (ctx, game, child) {
                        return GestureDetector(
                          onTap: () {
                            print('点击重玩');
                            game.replay();
                          },
                          child: new ButtonText(
                            width: 30,
                            height: 30,
                            color: Color(0xffdd1a1a),
                            text: '重玩(R)',
                            margin: const EdgeInsets.only(right: 15),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Consumer<Game>(builder: (ctx, game, child) {
                  return GestureDetector(
                    onTap: () {
                      print('点击旋转');
                      game.drop();
                    },
                    child: Container(
                      child: new ButtonText(
                        width: 100,
                        height: 100,
                        color: Color(0xff5a65f1),
                        text: '',
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            child: new Column(
              children: [
                Container(
                  transform: Matrix4.translationValues(0, 15, 0),
                  child: Transform(
                      transform: Matrix4.translationValues(0, 0, 0),
                      child: Consumer<Game>(builder: (ctx, game, child) {
                        return GestureDetector(
                          onTap: () {
                            print('点击旋转');
                            game.rotate();
                          },
                          child: new ButtonText(
                            width: 55,
                            height: 55,
                            color: Color(0xff5a65f1),
                            text: '',
                          ),
                        );
                      })),
                ),
                new Row(
                  children: [
                    Consumer<Game>(builder: (ctx, game, child) {
                      return GestureDetector(
                        onTap: () {
                          print('点击左移');
                          game.left();
                        },
                        child: new ButtonText(
                          width: 55,
                          height: 55,
                          color: Color(0xff5a65f1),
                          text: '',
                        ),
                      );
                    }),
                    new Container(
                      width: 50,
                      height: 60,
                      child: new Stack(
                        children: [
                          Positioned(
                            left: 25,
                            top: 3,
                            child: new Triangle(
                              direction: 'top',
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 23,
                            child: new Triangle(
                              direction: 'left',
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 23,
                            child: new Triangle(
                              direction: 'right',
                            ),
                          ),
                          Positioned(
                            left: 25,
                            bottom: 17,
                            child: new Triangle(
                              direction: 'bottom',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<Game>(builder: (ctx, game, child) {
                      return GestureDetector(
                        onTap: () {
                          print('点击右移');
                          game.right();
                        },
                        child: new ButtonText(
                          width: 55,
                          height: 55,
                          color: Color(0xff5a65f1),
                          text: '',
                        ),
                      );
                    })
                  ],
                ),
                new Transform(
                  transform: Matrix4.translationValues(0, -15, 0),
                  child: Consumer<Game>(builder: (ctx, game, child) {
                    return GestureDetector(
                      onTap: () {
                        game.down();
                      },
                      child: new ButtonText(
                        width: 55,
                        height: 55,
                        color: Color(0xff5a65f1),
                        text: '下降',
                      ),
                    );
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
