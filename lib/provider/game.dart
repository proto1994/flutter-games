import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  String _curModuleName;
  GameProvider() {
    this._curModuleName = 'loading';
  }

  String get curModuleName => this._curModuleName;
}
