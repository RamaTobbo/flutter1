import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserData with ChangeNotifier {
  int _weight = 60;
  int _age = 25;
  int _height = 165;
  String _userName = '';
  double _bmi = 20;
  String _userId = '';

  int get weight => _weight;
  int get age => _age;
  int get height => _height;
  String get userName => _userName;
  double get bmi => _bmi;
  String get userId => _userId;

  void setWeight(int newWeight) {
    _weight = newWeight;
    notifyListeners();
  }

  void setUserId(String newUserId) {
    _userId = newUserId;
    notifyListeners();
  }

  void setbmi(double newBmi) {
    _bmi = newBmi;
    notifyListeners();
  }

  void setusername(String newusername) {
    _userName = newusername;
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
