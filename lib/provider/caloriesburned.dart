import 'package:flutter/material.dart';

class CaloriesBurned with ChangeNotifier {
  double _caloriesBurned = 0;

  double get caloriesBurned => _caloriesBurned;

  double setCaloriesBurned(double value) {
    _caloriesBurned = value;
    return _caloriesBurned;
    notifyListeners();
  }
}
