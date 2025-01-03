import 'package:flutter/material.dart';

class WeatherProvider with ChangeNotifier {
  double _temp = 0;

  double get temp => _temp;

  void setTemp(double temp) {
    _temp = temp;
    notifyListeners();
  }
}
