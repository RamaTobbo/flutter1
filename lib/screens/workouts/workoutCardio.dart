import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/noSmartwatch/Home.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/screens/exercises/bicycle.dart';
import 'package:track_pro/screens/exercises/burpees.dart';
import 'package:track_pro/screens/exercises/jumpingJacks.dart';
import 'package:track_pro/screens/exercises/walking.dart';
import 'package:track_pro/screens/trainingExercises.dart';

class WorkoutCardio extends StatefulWidget {
  const WorkoutCardio({super.key});

  @override
  State<WorkoutCardio> createState() => _WorkoutCardioState();
}

class _WorkoutCardioState extends State<WorkoutCardio> {
  final style = TextStyle(color: Colors.black);
  int _selectedMinutes = 1;
  int _selectedMinutes1 = 1;
  int _selectedMinutes2 = 1;
  int _selectedMinutes3 = 1;
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

  void showTimerDialog2() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Timer Duration'),
          content: DropdownButton<int>(
            value: _selectedMinutes2,
            items: List.generate(60, (index) {
              return DropdownMenuItem(
                value: index + 1,
                child: Text('${index + 1} minute${index == 0 ? '' : 's'}'),
              );
            }),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedMinutes2 = value;
                });
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                startTimer(_selectedMinutes2);
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

  void showTimerDialog3() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Timer Duration'),
          content: DropdownButton<int>(
            value: _selectedMinutes3,
            items: List.generate(60, (index) {
              return DropdownMenuItem(
                value: index + 1,
                child: Text('${index + 1} minute${index == 0 ? '' : 's'}'),
              );
            }),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedMinutes3 = value;
                });
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                startTimer(_selectedMinutes3);
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
    final themeProvide = Provider.of<ThemeProvider>(context);
    final exercise1 =
        workoutData.getExercisesForWorkout(workoutData.getWorkoutNames()[2])[0];
    final exercise2 =
        workoutData.getExercisesForWorkout(workoutData.getWorkoutNames()[2])[1];
    final exercise3 =
        workoutData.getExercisesForWorkout(workoutData.getWorkoutNames()[2])[2];
    final exercise4 =
        workoutData.getExercisesForWorkout(workoutData.getWorkoutNames()[2])[3];
    final exerciseImage = workoutData
        .getExercisesForWorkout(workoutData.getWorkoutNames()[2])[0]
        .image;
    final exerciseImage1 = workoutData
        .getExercisesForWorkout(workoutData.getWorkoutNames()[2])[1]
        .image;
    final exerciseImage2 = workoutData
        .getExercisesForWorkout(workoutData.getWorkoutNames()[2])[2]
        .image;

    final exerciseImage3 = workoutData
        .getExercisesForWorkout(workoutData.getWorkoutNames()[2])[3]
        .image;

    String selectedWorkoutName = workoutData.getWorkoutNames()[1];
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Text(
                'Cardio',
                style: GoogleFonts.roboto(
                    color:
                        themeProvide.isDarkMode ? Colors.white : Colors.black),
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
                          color: const Color(0xffffce48),
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
                              MaterialPageRoute(
                                  builder: (ctx) => Jumpingjacks()),
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
                      //           onPressed: showTimerDialog,
                      //           icon: const Icon(
                      //               Icons.access_time_filled_outlined),
                      //           color: Colors.black),
                      //       const SizedBox(width: 5),
                      //       Text(
                      //         '$_selectedMinutes min',
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
                          color: const Color(0xffffce48),
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
                              MaterialPageRoute(builder: (ctx) => Burpees()),
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
                      //         onPressed: showTimerDialog1,
                      //         icon: const Icon(
                      //             Icons.access_time_filled_outlined),
                      //         color: Colors.black),
                      //     const SizedBox(width: 5),
                      //     Text(
                      //       '$_selectedMinutes1 min',
                      //       style: const TextStyle(color: Colors.black),
                      //     ),
                      //   ],
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
                          color: const Color(0xffffce48),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 20),
                      child: Text(
                        exercise3.name,
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
                              MaterialPageRoute(builder: (ctx) => Walking()),
                              (Route) => false);
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            color: Colors.white),
                        child: Image.asset(exerciseImage1),
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
                        child: Image.asset(exerciseImage2),
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
                          color: const Color(0xffffce48),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 20),
                      child: Text(
                        exercise4.name,
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
                              MaterialPageRoute(builder: (ctx) => Bicycle()),
                              (Route) => false);
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            color: Colors.white),
                        child: Image.asset(exerciseImage3),
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
                      MaterialPageRoute(builder: (ctx) => Trainingexercises()),
                      (Route) => false);
                },
                icon: Icon(Icons.arrow_back)))
      ],
    );
  }
}
