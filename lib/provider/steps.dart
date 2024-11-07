import 'package:flutter/material.dart';

class Steps with ChangeNotifier {
  double _steps = 0;

  double get steps => _steps;

  void setSteps(double step) {
    _steps = step;
    notifyListeners();
  }
}
