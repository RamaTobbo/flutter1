import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/models/Exercises.dart';
import 'package:track_pro/models/exercise.dart';
import 'package:track_pro/models/exercisesHistory.dart';
import 'package:track_pro/provider/userdata.dart';

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
  List<Exerciseshistory> _exercisesh = [];
  int _exerciseDuration = 0;
  String _exerciseName = '';
  String _exerciseDoneDate = '';
  double _caloriesBurnedPerExercise = 0;
  double _totalBurnedCalories = 0;

  List<Exercises> get exercises => _exercises;
  List<Exerciseshistory> get exercisesh => _exercisesh;
  int get exerciseDuration => _exerciseDuration;
  double get caloriesBurnedPerExercise => _caloriesBurnedPerExercise;
  String get exerciseName => _exerciseName;
  String get exerciseDoneDate => _exerciseDoneDate;
  double get totalBurnedCalories => _totalBurnedCalories;

  Future<void> fetchExercises(String userId) async {
    try {
      DateTime today = DateTime.now().toLocal();
      DateTime startOfDay = DateTime(today.year, today.month, today.day);
      DateTime endOfDay = startOfDay.add(Duration(days: 1));

      Timestamp startTimestamp = Timestamp.fromDate(startOfDay);
      Timestamp endTimestamp = Timestamp.fromDate(endOfDay);

      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('exercises')
          .where('date', isGreaterThanOrEqualTo: startTimestamp)
          .where('date', isLessThan: endTimestamp)
          .get();

      _exercisesh = snapshot.docs.map((doc) {
        return Exerciseshistory.fromFirestore(doc);
      }).toList();

      // Calculate total burned calories
      _totalBurnedCalories = _exercisesh.fold(
        0.0,
        (sum, exercise) => sum + exercise.caloriesBurned,
      );

      print("Total burned calories: $_totalBurnedCalories");
      notifyListeners();
    } catch (e) {
      print("Error fetching exercises from Firestore: $e");
    }
  }

  void addExercise(String name, double caloriesBurned) {
    _exercises.add(Exercises(name: name, caloriesBurned: caloriesBurned));
    notifyListeners();
  }

  void setExerciseDuration(int duration) {
    _exerciseDuration = duration;
    notifyListeners();
  }

  void settotalBurnedCaloriesPerDay(double burnedCalories) {
    _totalBurnedCalories = burnedCalories;
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
