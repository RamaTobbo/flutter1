import 'package:flutter/material.dart';

class Isasmartwatchuser with ChangeNotifier {
  bool _isUserSmartWatch = true;

  bool get isUsingSmartwatch => _isUserSmartWatch;

  void setUserMode(bool value) {
    _isUserSmartWatch = value;
    notifyListeners();
  }
}
