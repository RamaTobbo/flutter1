import 'package:flutter/material.dart';

class UserData with ChangeNotifier {
  int _weight = 60;

  int get weight => _weight;

  void setWeight(int newWeight) {
    _weight = newWeight;
    notifyListeners();
  }
}
