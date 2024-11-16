// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebaseService {
//   Future addUserDetails(Map<String, dynamic> userInfoMap) async {
//     return await FirebaseFirestore.instance
//         .collection('users')
//         .doc()
//         .set(userInfoMap);
//   }

//   Future addExercisesDetails(Map<String, dynamic> exercisesInfoMap) async {
//     return await FirebaseFirestore.instance
//         .collection('workouts')
//         .doc()
//         .set(exercisesInfoMap);
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:track_pro/models/Exercises.dart';
import 'package:track_pro/models/exercise.dart';
import 'package:track_pro/models/exercisesHistory.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String collectionPath = 'exercises';

  Future<List<Exerciseshistory>> getExercises() async {
    try {
      // Get today's start and end time
      DateTime now = DateTime.now();
      DateTime startOfDay = DateTime(now.year, now.month, now.day);
      DateTime endOfDay =
          startOfDay.add(Duration(days: 1)).subtract(Duration(milliseconds: 1));

      // Query Firestore for exercises done today
      final snapshot = await _db
          .collection(collectionPath)
          .where('date', isGreaterThanOrEqualTo: startOfDay)
          .where('date', isLessThanOrEqualTo: endOfDay)
          .get();

      // Convert documents to Exercise objects
      return snapshot.docs
          .map((doc) => Exerciseshistory.fromFirestore(doc))
          .toList();
    } catch (e) {
      print("Error fetching exercises for today: $e");
      return [];
    }
  }

  Future<void> addExercise(Exerciseshistory exercise) async {
    try {
      await _db.collection(collectionPath).add(exercise.toMap());
    } catch (e) {
      print('Error adding exercise: $e');
    }
  }

  // Delete an exercise from Firestore by ID
  Future<void> deleteExercise(String id) async {
    try {
      await _db.collection(collectionPath).doc(id).delete();
    } catch (e) {
      print('Error deleting exercise: $e');
    }
  }
}
