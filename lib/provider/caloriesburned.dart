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

  List<Exercises> get exercises => _exercises;
  List<Exerciseshistory> get exercisesh => _exercisesh;
  int get exerciseDuration => _exerciseDuration;
  double get caloriesBurnedPerExercise => _caloriesBurnedPerExercise;
  String get exerciseName => _exerciseName;
  String get exerciseDoneDate => _exerciseDoneDate;

  final FirestoreService _firestoreService = FirestoreService();

  Future<void> fetchExercises(String userId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('exercises')
          .get();

      if (snapshot.docs.isEmpty) {
        print("No exercises found in Firestore.");
      } else {
        print("Found exercises: ${snapshot.docs.length}");
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
