import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:track_pro/provider/caloriesburned.dart';
import 'package:track_pro/provider/userdata.dart';

import 'package:track_pro/screens/workouts/workoutCardio.dart';
import 'package:track_pro/widgets/finishedWorkouts.dart';
import 'package:track_pro/exercisesTutorial/exercisesTutorial.dart';

var userWeight;

class Exercisess extends StatefulWidget {
  final String exerciseName;
  final String workoutName;
  final String animationImage;
  final Function previousWorkout;

  final String nextExerciseRoute;
  final String videoTutorial;
  final int exerciseIndex;
  final List<String> workoutExercises;
  final List<String> workoutGifImages;
  final List<String> videoTutorials;

  const Exercisess({
    required this.exerciseName,
    required this.animationImage,
    required this.nextExerciseRoute,
    required this.videoTutorial,
    required this.workoutName,
    required this.exerciseIndex,
    required this.videoTutorials,
    required this.workoutExercises,
    required this.workoutGifImages,
    required this.previousWorkout,
    super.key,
  });

  @override
  State<Exercisess> createState() => _ExercisessState();
}

class _ExercisessState extends State<Exercisess> {
  bool isRunning = false;
  final audioPlayer = AudioPlayer();
  double caloriesBurned = 0.0;
  bool isWorkoutFinished = false;
  bool isAnimationDisplayed = true;
  int selectedDuration = 25;
  int countdownTimer = 25;
  int actualElapsedTime = 0;
  final int maxTimer = 3600;
  bool isPaused = false;

  Timer? timer;

  void playTestSound() async {
    try {
      await audioPlayer.play(AssetSource('completed.mp3'));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  int currentExerciseIndex = 0; // Keep track of the current exercise

  void nextExercise() {
    int nextIndex = widget.exerciseIndex + 1;
    if (nextIndex < widget.workoutExercises.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => Exercisess(
            exerciseName: widget.workoutExercises[nextIndex],
            animationImage: widget.workoutGifImages[nextIndex],
            videoTutorial: widget.videoTutorials[nextIndex],
            videoTutorials: widget.videoTutorials,
            workoutExercises: widget.workoutExercises,
            workoutGifImages: widget.workoutGifImages,
            nextExerciseRoute: "",
            workoutName: widget.workoutName,
            exerciseIndex: nextIndex, // Pass the new index
            previousWorkout: () {},
          ),
        ),
        // Clear the stack so user cannot go back
      );
    }
  }

  // Handle Previous Exercise
  void previousExercise() {
    int previousIndex = widget.exerciseIndex - 1;
    if (previousIndex >= 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => Exercisess(
            exerciseName: widget.workoutExercises[previousIndex],
            animationImage: widget.workoutGifImages[previousIndex],
            videoTutorial: widget.videoTutorials[previousIndex],
            videoTutorials: widget.videoTutorials,
            workoutExercises: widget.workoutExercises,
            workoutGifImages: widget.workoutGifImages,
            nextExerciseRoute: "",
            workoutName: widget.workoutName,
            exerciseIndex: previousIndex, // Pass the new index
            previousWorkout: () {},
          ),
        ),
        // Clear the stack so user cannot go back
      );
    }
  }

  void EndExerciseCalculatedCalories() {
    pauseTimer();
    final DateTime currentDate = DateTime.now();
    caloriesBurned = metValue * userWeight * (actualElapsedTime / 3600);
    if (caloriesBurned != 0) {
      Provider.of<CaloriesBurned>(context, listen: false)
          .addExercise(widget.exerciseName, caloriesBurned);
    }
    playTestSound();
    showCaloriesBurnedDialog();
  }

  void saveExerciseToFirestore(String userId, String exerciseName,
      double caloriesBurned, DateTime date) async {
    try {
      final exerciseData = {
        'exerciseName': exerciseName,
        'caloriesBurned': caloriesBurned,
        'date': Timestamp.fromDate(date), // Save as Timestamp
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('exercises')
          .add(exerciseData);

      print('Exercise saved successfully!');
    } catch (e) {
      print('Failed to save exercise: $e');
    }
  }

  void startTimer() {
    setState(() {
      if (timer == null || !timer!.isActive) {
        timer = Timer.periodic(Duration(seconds: 1), (_) {
          setState(() {
            isRunning = true;
            isPaused = false;
            actualElapsedTime++;
            if (countdownTimer > 0) {
              countdownTimer--;
            } else {
              pauseTimer();
              playTestSound();
              calculateCaloriesBurned();
              isWorkoutFinished = true;
            }
          });
        });
      }
    });
  }

  void nextWorkout() {
    // Check if current exercise is the last one
    if (widget.exerciseIndex == widget.workoutExercises.length - 1) {
      // Navigate to Finishedworkouts if it's the last exercise
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => Finishedworkouts(
            Workout: widget.workoutName, // workout name
            repeatWorkout: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => Exercisess(
                          exerciseName: widget.workoutExercises[0],
                          animationImage: widget.workoutGifImages[0],
                          videoTutorial: widget.videoTutorials[0],
                          videoTutorials: widget.videoTutorials,
                          workoutExercises: widget.workoutExercises,
                          workoutGifImages: widget.workoutGifImages,
                          nextExerciseRoute: "",
                          workoutName: widget.workoutName,
                          exerciseIndex: 0,
                          previousWorkout: () {},
                        )),
              );
            },
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => Exercisess(
            exerciseName: widget.workoutExercises[widget.exerciseIndex + 1],
            animationImage: widget.workoutGifImages[widget.exerciseIndex + 1],
            exerciseIndex: widget.exerciseIndex + 1,
            nextExerciseRoute: "",
            videoTutorials: widget.videoTutorials,
            workoutExercises: widget.workoutExercises,
            workoutGifImages: widget.workoutGifImages,
            videoTutorial: widget.workoutExercises[widget.exerciseIndex + 1],
            workoutName: widget.workoutName,
            previousWorkout: widget.previousWorkout,
          ),
        ),
      );
    }
  }

  void showCaloriesBurnedDialog() {
    final DateTime currentDate = DateTime.now();
    final userId = Provider.of<UserData>(context, listen: false).userId;
    if (caloriesBurned != 0) {
      saveExerciseToFirestore(
          userId, widget.exerciseName, caloriesBurned, currentDate);
    }
    ;

    showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (ctx) {
          return SizedBox(
            width: 700,
            height: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 98.0),
                  child: Row(
                    children: [
                      Image.asset('assets/images/fire.gif'),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => Exercisess(
                                      exerciseName: widget.exerciseName,
                                      animationImage: widget.animationImage,
                                      workoutName: widget.workoutName,
                                      exerciseIndex: widget.exerciseIndex,
                                      videoTutorials: widget.videoTutorials,
                                      workoutExercises: widget.workoutExercises,
                                      workoutGifImages: widget.workoutGifImages,
                                      nextExerciseRoute:
                                          widget.nextExerciseRoute,
                                      previousWorkout: widget.previousWorkout,
                                      videoTutorial: widget.videoTutorial)),
                            );
                          },
                          icon: Icon(Icons.restart_alt))
                    ],
                  ),
                ),
                Text(
                  "You burned ${caloriesBurned.toStringAsFixed(2)} calories!",
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: previousExercise,
                          icon: Icon(Icons.arrow_left)),
                      TextButton(
                        onPressed: previousExercise,
                        child: Text(
                          'Previous Exerice',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130.0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: nextWorkout,
                        child: Text(
                          'Next Workout',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                      IconButton(
                          onPressed: nextWorkout,
                          icon: Icon(Icons.arrow_right)),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  void pauseTimer() {
    setState(() {
      isPaused = true;
      isRunning = false;
      timer?.cancel();
    });
  }

  void resumeTimer() {
    startTimer();
  }

  String formatTime(int seconds) {
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  double metValue = 8;
  void calculateCaloriesBurned() {
    caloriesBurned = metValue * userWeight * (actualElapsedTime / 3600);
    showCaloriesBurnedDialog();
  }

  @override
  Widget build(BuildContext context) {
    final isRunning = timer != null && timer!.isActive;
    userWeight = Provider.of<UserData>(context).weight;

    if (caloriesBurned != 0)
      Provider.of<CaloriesBurned>(context)
          .addExercise('cycling', caloriesBurned);

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text(widget.exerciseName),
          ),
        ),
        body: Column(
          children: [
            isAnimationDisplayed
                ? Image.asset(
                    widget.animationImage,
                    width: 90,
                    height: 90,
                  )
                : Text('youtube video'),
            SizedBox(height: 20),
            ToggleSwitch(
              minWidth: 140.0,
              initialLabelIndex: 0,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: ['Animation', 'How to do'],
              activeBgColors: [
                [Color(0xffffce48)],
                [Color(0xffffce48)],
              ],
              onToggle: (index) {
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => Exercisestutorial(
                              videoUrl: widget.videoTutorial,
                            )),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Duration',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: isRunning || isPaused
                      ? null
                      : () {
                          if (selectedDuration > 5) {
                            setState(() {
                              selectedDuration -= 10;
                              countdownTimer = selectedDuration;
                            });
                          }
                        },
                  child: Text('-'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffffce48),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  formatTime(selectedDuration),
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: isRunning || isPaused
                      ? null
                      : () {
                          if (selectedDuration < maxTimer) {
                            setState(() {
                              selectedDuration += 10;
                              countdownTimer = selectedDuration;
                            });
                          }
                        },
                  child: Text('+'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffffce48),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: countdownTimer / selectedDuration,
                      color: Colors.amber,
                    ),
                    Center(
                      child: Text(
                        formatTime(countdownTimer),
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: isRunning
                  ? Column(
                      children: [
                        ElevatedButton(
                          onPressed: EndExerciseCalculatedCalories,
                          child: Text('End Exercise'),
                        ),
                        IconButton(
                          iconSize: 100,
                          onPressed: pauseTimer,
                          icon: Icon(
                            Icons.pause,
                            size: 100,
                          ),
                        ),
                      ],
                    )
                  : IconButton(
                      iconSize: 100,
                      onPressed: resumeTimer,
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: 100,
                      ),
                    ),
            ),
          ],
        ),
      ),
      // Positioned(
      //     top: 30,
      //     left: 10,
      //     child: IconButton(
      //         onPressed: () {
      //           widget.previousWorkout();
      //         },
      //         icon: Icon(Icons.arrow_back)))
    ]);
  }
}
