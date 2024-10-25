import 'package:flutter/material.dart';

class SetupData with ChangeNotifier {
  String enteredName = '';
  int selectedAgeValue = 0;
  int selectedHeightValue = 0;
  int selectedWeightValue = 0;

  void updateUserName(String name) {
    enteredName = name;
    notifyListeners();
  }

  void updateAge(int age) {
    selectedAgeValue = age;
    notifyListeners();
  }

  void updateHeight(int height) {
    selectedHeightValue = height;
    notifyListeners();
  }

  void updateWeight(int weight) {
    selectedWeightValue = weight;
    notifyListeners();
  }
}
