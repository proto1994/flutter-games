import 'package:flutter/material.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 80),
      // decoration: BoxDecoration(color: Colors.red),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
            ),
          ),
          new Expanded(
            flex: 8,
            child: Container(
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
                    height: 30,
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
                          height: 100,
                          transform: Matrix4.translationValues(0, -12, 0),
                          child: new Text(
                            '俄罗斯方块',
                            style: TextStyle(
                              fontSize: 20,
                              textBaseline: null,
                              color: Colors.black,
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
                      padding: EdgeInsets.all(30),
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
                            new Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                ),
                              ),
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
