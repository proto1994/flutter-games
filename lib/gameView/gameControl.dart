import 'package:flutter/material.dart';

class GameControl extends StatefulWidget {
  @override
  _GameControlState createState() => _GameControlState();
}

class _GameControlState extends State<GameControl> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              children: [
                Container(
                  child: new Row(
                    children: [
                      Container(
                        child: new Column(
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                boxShadow: [
                                  //阴影
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 4.0,
                                  )
                                ],
                                color: Color.fromRGBO(45, 196, 33, 1),
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                            Text(
                              '暂停',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Expanded(
            child: Container(
              child: Text('hell'),
            ),
          )
        ],
      ),
    );
  }
}
