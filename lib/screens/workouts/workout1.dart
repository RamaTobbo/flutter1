import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/noSmartwatch/Home.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/screens/exercises/lunge.dart';
import 'package:track_pro/screens/exercises/squats.dart';
import 'package:track_pro/screens/tab.dart';
import 'package:track_pro/screens/trainingExercises.dart';

var UserWithSmartWatch;

class WorkoutLowerBoddy extends StatefulWidget {
  const WorkoutLowerBoddy({super.key});

  @override
  State<WorkoutLowerBoddy> createState() => _WorkoutLowerBoddyState();
}

class _WorkoutLowerBoddyState extends State<WorkoutLowerBoddy> {
  final style = TextStyle(color: Colors.black);

  int _selectedMinutes = 1;
  int _selectedMinutes1 = 1;
  Timer? _timer;
  int _remainingTime = 0;

  void startTimer(int minutes) {
    setState(() {
      _remainingTime = minutes * 60;
    });

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel(); // Stop the timer when it reaches zero
        // You can show a notification or alert here
      }
    });
  }

  void showTimerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Timer Duration'),
          content: DropdownButton<int>(
            value: _selectedMinutes,
            items: List.generate(60, (index) {
              return DropdownMenuItem(
                value: index + 1,
                child: Text('${index + 1} minute${index == 0 ? '' : 's'}'),
              );
            }),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedMinutes = value;
                });
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                startTimer(_selectedMinutes);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => TabNav1()));
              },
              child: Text('Start Exercise'),
            ),
          ],
        );
      },
    );
  }

  void showTimerDialog1() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Timer Duration'),
          content: DropdownButton<int>(
            value: _selectedMinutes1,
            items: List.generate(60, (index) {
              return DropdownMenuItem(
                value: index + 1,
                child: Text('${index + 1} minute${index == 0 ? '' : 's'}'),
              );
            }),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedMinutes1 = value;
                });
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                startTimer(_selectedMinutes1);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => TabNav1()));
              },
              child: Text('Start Exercise'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final workoutData = Provider.of<WorkoutData>(context);
    UserWithSmartWatch =
        Provider.of<Isasmartwatchuser>(context).isUsingSmartwatch;
    final themeProvide = Provider.of<ThemeProvider>(context);
    final exercise1 =
        workoutData.getExercisesForWorkout(workoutData.getWorkoutNames()[0])[0];
    final exercise2 =
        workoutData.getExercisesForWorkout(workoutData.getWorkoutNames()[0])[1];
    final exerciseImage = workoutData
        .getExercisesForWorkout(workoutData.getWorkoutNames()[0])[0]
        .image;
    final exerciseImage1 = workoutData
        .getExercisesForWorkout(workoutData.getWorkoutNames()[0])[1]
        .image;

    String selectedWorkoutName = workoutData.getWorkoutNames()[0];
    return Stack(
      children: [
        Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Padding(
                  padding: EdgeInsets.only(left: 48),
                  child: Text(
                    'Lower Boddy',
                    style: GoogleFonts.roboto(
                        color: themeProvide.isDarkMode
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
              body: Column(
                children: [
                  ListTile(
                    title: Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 350,
                            height: 107,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xfff9e0e4),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 20),
                          child: Text(
                            exercise1.name,
                            style: GoogleFonts.robotoFlex(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          right: 30,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => Lunge()),
                                    (Route) => false);
                              },
                              child: Text('Begin', style: style),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                            ),
                            // child: Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     IconButton(
                            //         onPressed: showTimerDialog,
                            //         icon: const Icon(
                            //             Icons.access_time_filled_outlined),
                            //         color: Colors.black),
                            //     const SizedBox(width: 5),
                            //     Text(
                            //       '$_selectedMinutes min',
                            //       style: const TextStyle(color: Colors.black),
                            //     ),
                            //   ],
                            // ),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 30,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: Colors.white),
                            child: Image.asset(exerciseImage),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 350,
                            height: 107,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xfff9e0e4),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 20),
                          child: Text(
                            exercise2.name,
                            style: GoogleFonts.robotoFlex(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          right: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => Squats()));
                            },
                            child: Text('Begin', style: style),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 30,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: Colors.white),
                            child: Image.asset(exerciseImage1),
                          ),
                        ),
                      ],
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
                      MaterialPageRoute(
                          builder: (ctx) =>
                              UserWithSmartWatch ? TabNav() : TabNav1()),
                      (Route) => false);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
