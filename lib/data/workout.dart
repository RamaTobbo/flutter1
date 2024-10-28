import 'package:flutter/material.dart';
import 'package:track_pro/models/exercise.dart';
import 'package:track_pro/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  List<Workout> workoutList = [
    Workout(name: 'Lower Body', exercise: [
      Exercise(name: 'Lunges', timer: 1),
      Exercise(name: 'Squats', timer: 1)
    ]),
    Workout(name: 'Core', exercise: [
      Exercise(name: 'Plank', timer: 1),
      Exercise(name: 'Russian Twist', timer: 1)
    ]),
    Workout(name: 'Cardio', exercise: [
      Exercise(name: 'Jumping Jacks', timer: 1),
      Exercise(name: 'Burpees', timer: 1),
      Exercise(name: 'Walking', timer: 1),
      Exercise(name: 'Bicycle', timer: 1),
    ])
  ];
  List<Workout> getWorkoutList() {
    return workoutList;
  }
}
