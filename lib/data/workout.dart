import 'package:flutter/material.dart';
import 'package:track_pro/models/exercise.dart';
import 'package:track_pro/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  List<Workout> workoutList = [
    Workout(name: 'Lower Body', image: 'assets/images/low.png', exercise: [
      Exercise(name: 'Lunges', image: 'assets/images/low.png'),
      Exercise(name: 'Squats', image: 'assets/images/squats.png')
    ]),
    Workout(name: 'Core', image: 'assets/images/abs.png', exercise: [
      Exercise(name: 'Plank', image: 'assets/images/plank.png'),
      Exercise(name: 'Russian Twist', image: 'assets/images/russian-twist.png')
    ]),
    Workout(name: 'Cardio', image: 'assets/images/heartmuscle.png', exercise: [
      Exercise(name: 'Jumping Jacks', image: 'assets/images/jumping-jack.png'),
      Exercise(name: 'Burpees', image: 'assets/images/low.png'),
      Exercise(name: 'Walking', image: 'assets/images/walk.png'),
      Exercise(name: 'Bicycle', image: 'assets/images/bicycle.png'),
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
