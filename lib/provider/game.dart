import 'package:flutter/material.dart';
import './config.dart';

class GameProvider with ChangeNotifier {
  int _gameIndex;
  int _gameLevel;
  bool _isStart;
  GameProvider() {
    this._gameIndex = 0;
    this._gameLevel = 0;
    this._isStart = false;
  }

  int get gameIndex => this._gameIndex;
  int get gameLevel => this._gameLevel;
  bool get isStart => this._isStart;

  changeGame() {
    this._gameIndex++;
    notifyListeners();
  }

  changeLevel() {
    this._gameLevel++;
    notifyListeners();
  }

  startGame() {
    this._isStart = true;
  }
}
