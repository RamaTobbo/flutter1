import 'package:flutter/material.dart';
import 'package:track_pro/models/exercise.dart';
import 'package:track_pro/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  List<Workout> workoutList = [
    Workout(name: 'Lower Body', exercise: [
      Exercise(name: 'Lunges', timer: 1, image: 'assets/images/low.png'),
      Exercise(name: 'Squats', timer: 1, image: 'assets/images/squats.png')
    ]),
    Workout(name: 'Core', exercise: [
      Exercise(name: 'Plank', timer: 1, image: 'assets/images/plank.png'),
      Exercise(
          name: 'Russian Twist',
          timer: 1,
          image: 'assets/images/russian-twist.png')
    ]),
    Workout(name: 'Cardio', exercise: [
      Exercise(
          name: 'Jumping Jacks',
          timer: 1,
          image: 'assets/images/jumping-jack.png'),
      Exercise(name: 'Burpees', timer: 1, image: 'assets/images/low.png'),
      Exercise(name: 'Walking', timer: 1, image: 'assets/images/walk.png'),
      Exercise(name: 'Bicycle', timer: 1, image: 'assets/images/bicycle.png'),
    ])
  ];
  List<Workout> getWorkoutList() {
    return workoutList;
  }

  List<String> getWorkoutNames() {
    return workoutList.map((workout) => workout.name).toList();
  }

  List<Exercise> getExercisesForWorkout(String workoutName) {
    return workoutList
        .firstWhere((workout) => workout.name == workoutName)
        .exercise;
  }
}
