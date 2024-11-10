import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  Future addUserDetails(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc()
        .set(userInfoMap);
  }

  Future addExercisesDetails(Map<String, dynamic> exercisesInfoMap) async {
    return await FirebaseFirestore.instance
        .collection('workouts')
        .doc()
        .set(exercisesInfoMap);
  }
}
