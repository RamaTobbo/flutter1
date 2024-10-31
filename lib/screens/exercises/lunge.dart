import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:track_pro/exercisesTutorial/lungeExercise.dart';
import 'package:track_pro/provider/caloriesburned.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/exercises/squats.dart';
import 'package:track_pro/screens/workouts/workout1.dart';

var userWeight;
var BurnedCaloriesPerExercise;

class Lunge extends StatefulWidget {
  const Lunge({super.key});

  @override
  State<Lunge> createState() => _LungeState();
}

class _LungeState extends State<Lunge> {
  final audioPlayer = AudioPlayer();
  double caloriesBurned = 0.0;
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
            }
          });
        });
      }
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

  void nextExercise() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (ctx) => Squats()), (Route) => false);
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
                          onPressed: nextExercise,
                          icon: Icon(Icons.arrow_right_alt)),
                      TextButton(
                          onPressed: nextExercise,
                          child: Text(
                            'Next Exercise',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    BurnedCaloriesPerExercise =
        Provider.of<CaloriesBurned>(context).setCaloriesBurned(caloriesBurned);
    final isRunning = timer != null && timer!.isActive;
    userWeight = Provider.of<UserData>(context).weight;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Text('Lunge Exercise'),
            ),
          ),
          body: Column(
            children: [
              isAnimationDisplayed
                  ? SizedBox(
                      width: 170,
                      height: 170,
                      child: Image.asset('assets/images/lunge.gif',
                          fit: BoxFit.cover),
                    )
                  : Text('youtube video'),
              SizedBox(height: 0),
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
                      MaterialPageRoute(builder: (ctx) => LungeExercise()),
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
                    onPressed: () {
                      if (selectedDuration > 1) {
                        setState(() {
                          selectedDuration--;
                          countdownTimer =
                              selectedDuration; // reset countdown timer
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
                  width: 162,
                  height: 162,
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
            top: 30,
            child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (ctx) => WorkoutLowerBoddy()),
                      (Route) => false);
                },
                icon: Icon(Icons.arrow_back)))
      ],
    );
  }
}
