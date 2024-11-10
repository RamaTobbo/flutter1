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
  int _exerciseDuration = 0;
  String _exerciseName = '';
  String _exerciseDoneDate = '';
  double _caloriesBurnedPerExercise = 0;

  List<Exercises> get exercises => _exercises;
  int get exerciseDuration => _exerciseDuration;
  double get caloriesBurnedPerExercise => _caloriesBurnedPerExercise;
  String get exerciseName => _exerciseName;
  String get exerciseDoneDate => _exerciseDoneDate;

  void addExercise(String name, double caloriesBurned) {
    _exercises.add(Exercises(name: name, caloriesBurned: caloriesBurned));
    notifyListeners();
  }

  void setExerciseDuration(int duration) {
    _exerciseDuration = duration;
    notifyListeners();
  }

  void setCaloriesBurnedPerExercis(double caloriesBurnedPerExercise) {
    _caloriesBurnedPerExercise = caloriesBurnedPerExercise;
    notifyListeners();
  }

  void setExerciseName(String name) {
    _exerciseName = name;
    notifyListeners();
  }

  void setExerciseDate(String date) {
    _exerciseDoneDate = date;
    notifyListeners();
  }
}
