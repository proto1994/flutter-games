import 'package:flutter/material.dart';

class StartProvider with ChangeNotifier {
  bool _loadingStatus;
  StarProvider() {
    _loadingStatus = true;
  }

  bool get loadingStatus => this._loadingStatus;
}
