import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/noSmartwatch/Home.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/screens/exercises/bicycle.dart';
import 'package:track_pro/screens/exercises/burpees.dart';
import 'package:track_pro/screens/exercises/jumpingJacks.dart';
import 'package:track_pro/screens/exercises/walking.dart';
import 'package:track_pro/screens/tab.dart';
import 'package:track_pro/screens/trainingExercises.dart';

var UserWithSmartWatch;

class WorkoutCardio extends StatefulWidget {
  const WorkoutCardio({super.key});

  @override
  State<WorkoutCardio> createState() => _WorkoutCardioState();
}

class _WorkoutCardioState extends State<WorkoutCardio> {
  final style = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    UserWithSmartWatch =
        Provider.of<Isasmartwatchuser>(context).isNotUsingSmartwatch;

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
        PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: Text(
                  'Cardio',
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
        ),
        Positioned(
            top: 30,
            child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => TabNav1(
                                index: 3,
                              )),
                      (Route) => false);
                },
                icon: Icon(Icons.arrow_back)))
      ],
    );
  }
}
