import 'package:flutter/material.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.only(top: 80),
      // decoration: BoxDecoration(color: Colors.red),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          new Expanded(
              flex: 8,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '俄罗斯方块',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Container(
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
                ],
              )),
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
