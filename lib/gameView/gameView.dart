import 'package:flutter/material.dart';
import './gameCube.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  Widget build(BuildContext context) {
    return Container(
      height: 393,
      margin: const EdgeInsets.only(bottom: 50),
      // decoration: BoxDecoration(color: Colors.red),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: Container(),
          ),
          Container(
            width: 300,
            // padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 6, color: Colors.black),
                right: BorderSide(width: 6, color: Colors.black),
                bottom: BorderSide(width: 6, color: Colors.black),
              ),
            ),
            child: new Column(
              children: [
                Container(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Expanded(
                          child: new Row(
                            children: [
                              Container(
                                height: 5,
                                width: 40,
                                color: Colors.black,
                                margin: const EdgeInsets.only(right: 5),
                              ),
                              Container(
                                height: 5,
                                width: 10,
                                color: Colors.black,
                                margin: const EdgeInsets.only(right: 5),
                              ),
                              Container(
                                height: 5,
                                width: 10,
                                color: Colors.black,
                                margin: const EdgeInsets.only(right: 5),
                              ),
                              Container(
                                height: 5,
                                width: 10,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, 8, 0),
                        child: new Text(
                          '俄罗斯方块',
                          style: TextStyle(
                            fontSize: 20,
                            textBaseline: null,
                            color: Colors.black,
                            height: 0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 5,
                                width: 10,
                                color: Colors.black,
                                margin: const EdgeInsets.only(right: 5),
                              ),
                              Container(
                                height: 5,
                                width: 10,
                                color: Colors.black,
                                margin: const EdgeInsets.only(right: 5),
                              ),
                              Container(
                                height: 5,
                                width: 10,
                                color: Colors.black,
                                margin: const EdgeInsets.only(right: 5),
                              ),
                              Container(
                                height: 5,
                                width: 40,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Expanded(
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 10,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: new Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: new GameCube(),
                          ),
                          new Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          new Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
