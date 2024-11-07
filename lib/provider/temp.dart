import 'package:flutter/material.dart';

class temp with ChangeNotifier {
  double _temp1 = 0;
  int _humidity = 0;
  String _mainCondition = "";

  double get temp1 => _temp1;
  int get humidity => _humidity;
  String get mainCondition => _mainCondition;

  void setemp(double temp) {
    _temp1 = temp;
    notifyListeners();
  }

  void setHumidity(int humidity) {
    _humidity = humidity;
    notifyListeners();
  }

  void setCondition(String mainConditon) {
    _mainCondition = mainCondition;
    notifyListeners();
  }
}
