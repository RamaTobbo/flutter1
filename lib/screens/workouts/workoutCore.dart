import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/noSmartwatch/Home.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/screens/exercises/plank.dart';
import 'package:track_pro/screens/exercises/russian_twist.dart';
import 'package:track_pro/screens/tab.dart';
import 'package:track_pro/screens/trainingExercises.dart';

var UserWithSmartWatch;

class WorkoutCore extends StatefulWidget {
  const WorkoutCore({super.key});

  @override
  State<WorkoutCore> createState() => _WorkoutCoreState();
}

class _WorkoutCoreState extends State<WorkoutCore> {
  int _selectedMinutes = 1;
  int _selectedMinutes1 = 1;
  Timer? _timer;
  int _remainingTime = 0;
  final style = TextStyle(color: Colors.black);
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => TabNav1(
                          index: 3,
                        )));
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => TabNav1(
                          index: 3,
                        )));
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
    final themeProvide = Provider.of<ThemeProvider>(context);
    UserWithSmartWatch =
        Provider.of<Isasmartwatchuser>(context).isNotUsingSmartwatch;
    final exercise1 =
        workoutData.getExercisesForWorkout(workoutData.getWorkoutNames()[1])[0];
    final exercise2 =
        workoutData.getExercisesForWorkout(workoutData.getWorkoutNames()[1])[1];
    final exerciseImage = workoutData
        .getExercisesForWorkout(workoutData.getWorkoutNames()[1])[0]
        .image;
    final exerciseImage1 = workoutData
        .getExercisesForWorkout(workoutData.getWorkoutNames()[1])[1]
        .image;

    String selectedWorkoutName = workoutData.getWorkoutNames()[1];
    return Stack(
      children: [
        PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: Text(
                  'Core',
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
                            color: const Color(0xff8082a2),
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
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (ctx) => Plank()),
                                (Route) => false);
                          },
                          child: Text(
                            'Begin',
                            style: style,
                          ),
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
                            color: const Color(0xff8082a2),
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
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => RussianTwist()),
                                (Route) => false);
                          },
                          child: Text(
                            'Begin',
                            style: style,
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                        ),

                        // child: Center(
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       IconButton(
                        //           onPressed: showTimerDialog1,
                        //           icon: const Icon(
                        //               Icons.access_time_filled_outlined),
                        //           color: Colors.black),
                        //       const SizedBox(width: 5),
                        //       Text(
                        //         '$_selectedMinutes1 min',
                        //         style: const TextStyle(color: Colors.black),
                        //       ),
                        //     ],
                        //   ),
                        // ),
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
                          child: Image.asset(exerciseImage1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 30,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => UserWithSmartWatch
                              ? TabNav(
                                  index: 3,
                                )
                              : TabNav1(
                                  index: 3,
                                )));
                },
                icon: Icon(Icons.arrow_back)))
      ],
    );
  }
}
