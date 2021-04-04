import 'package:flutter/material.dart';

import '../Widgets/buttonText.dart';
import '../Widgets/triangle.dart';
import '../utils/eventBus.dart';

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
                      new ButtonText(
                        width: 30,
                        height: 30,
                        color: Color.fromRGBO(45, 196, 33, 1),
                        text: '暂停(P)',
                        margin: const EdgeInsets.only(right: 15),
                      ),
                      new ButtonText(
                        width: 30,
                        height: 30,
                        color: Color.fromRGBO(45, 196, 33, 1),
                        text: '音效(S)',
                        margin: const EdgeInsets.only(right: 15),
                      ),
                      new ButtonText(
                        width: 30,
                        height: 30,
                        color: Color(0xffdd1a1a),
                        text: '重玩(R)',
                        margin: const EdgeInsets.only(right: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: new ButtonText(
                    width: 100,
                    height: 100,
                    color: Color(0xff5a65f1),
                    text: '掉落(SPACE)',
                  ),
                )
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
                    child: new ButtonText(
                      width: 55,
                      height: 55,
                      color: Color(0xff5a65f1),
                      text: '上移',
                    ),
                  ),
                ),
                new Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('点击左移');
                        eventBus.emit('tetris', 'left');
                      },
                      child: new ButtonText(
                        width: 55,
                        height: 55,
                        color: Color(0xff5a65f1),
                        text: '左移',
                      ),
                    ),
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
                    GestureDetector(
                      onTap: () {
                        print('点击右移');
                        eventBus.emit('tetris', 'right');
                      },
                      child: new ButtonText(
                        width: 55,
                        height: 55,
                        color: Color(0xff5a65f1),
                        text: '右移',
                      ),
                    )
                  ],
                ),
                new Transform(
                  transform: Matrix4.translationValues(0, -15, 0),
                  child: GestureDetector(
                    onTap: () {
                      print('点击下移');
                      eventBus.emit('tetris', 'down');
                    },
                    child: new ButtonText(
                      width: 55,
                      height: 55,
                      color: Color(0xff5a65f1),
                      text: '下移',
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
