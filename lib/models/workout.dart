import 'package:track_pro/models/exercise.dart';

class Workout {
  Workout({required this.name, required this.exercise});
  final String name;
  final List<Exercise> exercise;
}
