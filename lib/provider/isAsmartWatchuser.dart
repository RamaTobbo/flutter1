import 'package:flutter/material.dart';

class Isasmartwatchuser with ChangeNotifier {
  bool _iSNotaSmartWatchUser = false;

  bool get isNotUsingSmartwatch => _iSNotaSmartWatchUser;

  void setUserMode(bool value) {
    _iSNotaSmartWatchUser = value;
    notifyListeners();
  }
}
