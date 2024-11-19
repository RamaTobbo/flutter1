import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/models/Exercises.dart';
import 'package:track_pro/models/exercise.dart';
import 'package:track_pro/models/exercisesHistory.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/services/firebase.dart';

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

  final FirestoreService _firestoreService = FirestoreService();

  Future<void> fetchExercises(String userId) async {
    try {
      // Get today's date and set the start and end of the day
      DateTime today = DateTime.now().toLocal();
      DateTime startOfDay = DateTime(today.year, today.month, today.day);
      DateTime endOfDay = startOfDay.add(Duration(days: 1));

      // Convert DateTime to Firestore Timestamps
      Timestamp startTimestamp = Timestamp.fromDate(startOfDay);
      Timestamp endTimestamp = Timestamp.fromDate(endOfDay);

      // Query to fetch exercises where the date is today
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('exercises')
          .where('date', isGreaterThanOrEqualTo: startTimestamp)
          .where('date', isLessThan: endTimestamp)
          .get();

      if (snapshot.docs.isEmpty) {
        print("No exercises found for today.");
      } else {
        print("Found exercises for today: ${snapshot.docs.length}");
        // Print the date of each fetched exercise to debug
        snapshot.docs.forEach((doc) {
          print("Exercise date: ${doc['date']}");
        });
      }

      _exercisesh = snapshot.docs.map((doc) {
        return Exerciseshistory.fromFirestore(doc);
      }).toList();

      print("Exercises fetched: $_exercisesh");
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

  Future<void> removeExercise(String id) async {
    await _firestoreService.deleteExercise(id);
    await fetchExercises(id);
  }

  void setExerciseDate(String date) {
    _exerciseDoneDate = date;
    notifyListeners();
  }
}
