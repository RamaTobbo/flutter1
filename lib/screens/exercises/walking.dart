import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:track_pro/exercisesTutorial/lungeExercise.dart';

class Walking extends StatefulWidget {
  const Walking({super.key});

  @override
  State<Walking> createState() => _WalkingState();
}

class _WalkingState extends State<Walking> {
  bool isAnimationDisplayed = true;
  int selectedDuration = 25;
  int countdownTimer = 25;
  final int maxTimer = 3600;
  Timer? timer;

  void startTimer() {
    setState(() {
      if (timer == null || !timer!.isActive) {
        timer = Timer.periodic(Duration(seconds: 1), (_) {
          setState(() {
            if (countdownTimer > 0) {
              countdownTimer--;
            } else {
              pauseTimer();
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

  @override
  Widget build(BuildContext context) {
    final isRunning = timer != null && timer!.isActive;

    return Scaffold(
      appBar: AppBar(
        title: Text('Walking Exercise'),
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
          ToggleSwitch(
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
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
    );
  }
}
