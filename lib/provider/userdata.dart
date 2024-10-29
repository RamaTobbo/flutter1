import 'package:flutter/material.dart';

class UserData with ChangeNotifier {
  int _weight = 60;
  int _age = 25;
  int _height = 165;

  int get weight => _weight;
  int get age => _age;
  int get height => _height;

  void setWeight(int newWeight) {
    _weight = newWeight;
    notifyListeners();
  }

  void setAge(int newAge) {
    _age = newAge;
    notifyListeners();
  }

  void setHeight(int newheight) {
    _height = newheight;
    notifyListeners();
  }
}
