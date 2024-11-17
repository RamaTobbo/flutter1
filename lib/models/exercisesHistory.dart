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

  // Convert Exercise to a map (for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'exerciseName': exerciseName,
      'caloriesBurned': caloriesBurned, // Save as double
      'date': Timestamp.fromDate(date), // Save as Timestamp (not string)
    };
  }

  // Convert a Firestore document to an Exercise instance
  factory Exerciseshistory.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Handle Firestore Timestamp for date field
    final timestamp = data['date'];
    DateTime date;
    if (timestamp is Timestamp) {
      // If the date is stored as a Timestamp, convert it to DateTime
      date = timestamp.toDate();
    } else if (timestamp is String) {
      // If the date is stored as a String, parse it (e.g., MM/dd/yyyy)
      date = DateFormat('MM/dd/yyyy').parse(timestamp);
    } else {
      // Handle any other unexpected type or missing field
      date = DateTime.now(); // Default to current date if invalid or missing
    }

    // Handle caloriesBurned field which might be a String or a number
    var calories = data['caloriesBurned'];
    double caloriesBurned = (calories is String)
        ? double.tryParse(calories) ??
            0.0 // If it's a string, parse it to double
        : calories.toDouble(); // If it's already a number, convert it to double

    return Exerciseshistory(
      id: doc.id,
      exerciseName: data['exerciseName'],
      caloriesBurned: caloriesBurned,
      date: date,
    );
  }
}
