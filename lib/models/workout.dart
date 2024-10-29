import 'package:track_pro/models/exercise.dart';

class Workout {
  Workout({required this.name, required this.exercise, required this.image});
  final String name;
  final List<Exercise> exercise;
  final String image;
}
