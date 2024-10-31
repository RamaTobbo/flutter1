import 'package:flutter/material.dart';
import 'package:track_pro/models/Exercises.dart';
import 'package:track_pro/models/exercise.dart';

// class CaloriesBurned with ChangeNotifier {
//   double _caloriesBurned = 0;

//   double get caloriesBurned => _caloriesBurned;

//   double setCaloriesBurned(double value) {
//     _caloriesBurned = value;
//     return _caloriesBurned;
//     notifyListeners();
//   }
// }
class CaloriesBurned with ChangeNotifier {
  List<Exercises> _exercises = [];

  List<Exercises> get exercises => _exercises;

  void addExercise(String name, double caloriesBurned) {
    _exercises.add(Exercises(name: name, caloriesBurned: caloriesBurned));
    notifyListeners();
  }
}
