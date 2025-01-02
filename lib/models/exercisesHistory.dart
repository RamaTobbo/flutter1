import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Exerciseshistory {
  final String id;
  final String exerciseName;
  final double caloriesBurned;
  final DateTime date;

  Exerciseshistory({
    required this.id,
    required this.exerciseName,
    required this.caloriesBurned,
    required this.date,
  });

  factory Exerciseshistory.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    final timestamp = data['date'];
    DateTime date;
    if (timestamp is Timestamp) {
      date = timestamp.toDate();
    } else if (timestamp is String) {
      date = DateFormat('MM/dd/yyyy').parse(timestamp);
    } else {
      date = DateTime.now();
    }

    var calories = data['caloriesBurned'];
    double caloriesBurned = (calories is String)
        ? double.tryParse(calories) ?? 0.0
        : calories.toDouble();

    return Exerciseshistory(
      id: doc.id,
      exerciseName: data['exerciseName'],
      caloriesBurned: caloriesBurned,
      date: date,
    );
  }
}
