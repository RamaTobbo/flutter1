import 'package:cloud_firestore/cloud_firestore.dart';

class Exerciseshistory {
  final String id;
  final String name;
  final double caloriesBurned;
  final DateTime date;

  Exerciseshistory({
    required this.id,
    required this.name,
    required this.caloriesBurned,
    required this.date,
  });

  // Convert Exercise to a map (for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'caloriesBurned': caloriesBurned,
      'date': date.toIso8601String(),
    };
  }

  // Convert a Firestore document to an Exercise instance
  factory Exerciseshistory.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Exerciseshistory(
      id: doc.id,
      name: data['name'],
      caloriesBurned: data['caloriesBurned'],
      date: DateTime.parse(data['date']),
    );
  }
}
