import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:track_pro/exercisesTutorial/lungeExercise.dart';
import 'package:track_pro/provider/caloriesburned.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/exercises/jumpingJacks.dart';
import 'package:track_pro/screens/exercises/walking.dart';
import 'package:track_pro/screens/workouts/workoutCardio.dart';
import 'package:track_pro/widgets/finishedWorkouts.dart';

var userWeight;

class Bicycle extends StatefulWidget {
  const Bicycle({super.key});

  @override
  State<Bicycle> createState() => _BicycleState();
}

class _BicycleState extends State<Bicycle> {
  final audioPlayer = AudioPlayer();
  double caloriesBurned = 0.0;
  bool isWorkoutFinished = false;
  bool isAnimationDisplayed = true;
  int selectedDuration = 25;
  int countdownTimer = 25;
  final int maxTimer = 3600;
  Timer? timer;
  void playTestSound() async {
    try {
      await audioPlayer.play(AssetSource('completed.mp3'));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  void nextExercise() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (ctx) => Jumpingjacks()), (Route) => false);
  }

  void startTimer() {
    setState(() {
      if (timer == null || !timer!.isActive) {
        timer = Timer.periodic(Duration(seconds: 1), (_) {
          setState(() {
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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => Finishedworkouts(
                  Workout: 'Cardio',
                  repeatWorkout: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (ctx) => Jumpingjacks()),
                        (Route) => false);
                  },
                )));
  }

  void previousExercise() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (ctx) => Walking()), (Route) => false);
  }

  void showCaloriesBurnedDialog() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SizedBox(
            width: 700,
            height: 300,
            child: Column(
              children: [
                Image.asset('assets/images/fire.gif'),
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
    caloriesBurned = metValue * userWeight * (selectedDuration / 3600);
    showCaloriesBurnedDialog();
  }

  @override
  Widget build(BuildContext context) {
    final isRunning = timer != null && timer!.isActive;
    userWeight = Provider.of<UserData>(context).weight;
    if (isWorkoutFinished)
      final BurnedCaloriesPerExerciseSquats =
          Provider.of<CaloriesBurned>(context)
              .addExercise('lunge', caloriesBurned);

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text('Bicycle Exercise'),
          ),
        ),
        body: Column(
          children: [
            isAnimationDisplayed
                ? Image.asset(
                    'assets/images/heartpulse.png',
                    width: 90,
                    height: 90,
                  )
                : Text('youtube video'),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 222.0),
              child: ToggleSwitch(
                minWidth: 140.0,
                initialLabelIndex: 0,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 1,
                labels: ['Animation'],
                activeBgColors: [
                  [Color(0xffffce48)],
                ],
              ),
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
                  onPressed: () {
                    if (selectedDuration > 1) {
                      setState(() {
                        selectedDuration--;
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
                  onPressed: () {
                    if (selectedDuration < maxTimer) {
                      setState(() {
                        selectedDuration++;
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
              child: IconButton(
                iconSize: 100,
                onPressed: isRunning ? pauseTimer : resumeTimer,
                icon: Icon(
                  isRunning ? Icons.pause : Icons.play_arrow_rounded,
                  size: 100,
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
          child: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => WorkoutCardio()),
                    (Route) => false);
              },
              icon: Icon(Icons.arrow_back)))
    ]);
  }
}
