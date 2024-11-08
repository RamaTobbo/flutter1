import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/screens/CaloriesBurnedPerExercise.dart';
import 'package:track_pro/screens/exercises/burpees.dart';
import 'package:track_pro/screens/exercises/jumpingJacks.dart';
import 'package:track_pro/screens/exercises/lunge.dart';
import 'package:track_pro/screens/exercises/plank.dart';
import 'package:track_pro/screens/exercises/russian_twist.dart';
import 'package:track_pro/screens/workout.dart';
import 'package:track_pro/screens/workout2.dart';
import 'package:track_pro/screens/workout3.dart';
import 'package:track_pro/screens/workouts/workout1.dart';
import 'package:track_pro/screens/workouts/workoutCardio.dart';
import 'package:track_pro/screens/workouts/workoutCore.dart';

class Trainingexercises extends StatefulWidget {
  const Trainingexercises({super.key});

  @override
  State<Trainingexercises> createState() => _TrainingexercisesState();
}

class _TrainingexercisesState extends State<Trainingexercises> {
  _getColorForIndex(int index) {
    switch (index) {
      case 0:
        return const Color(0xfff9e0e4);
      case 1:
        return const Color(0xff8082a2);
      case 2:
        return const Color(0xffffdd7f);
      case 3:
        return const Color(0xffb6c7ca);
      default:
        return Colors.grey;
    }
  }

  _goToexerciseForIndex(int index) {
    switch (index) {
      case 0:
        return Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (ctx) => Plank()), (Route) => false);
      case 1:
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (ctx) => Jumpingjacks()),
            (Route) => false);
      case 2:
        return Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (ctx) => Burpees()), (Route) => false);
      case 3:
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (ctx) => RussianTwist()),
            (Route) => false);
      default:
        return Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (ctx) => Plank()), (Route) => false);
    }
  }

  Widget sizedbox(int index) {
    if (index == 0) {
      return const SizedBox(
        width: 90,
      );
    } else if (index == 1) {
      return const SizedBox(
        width: 150,
      );
    } else {
      return const SizedBox(
        width: 130,
      );
    }
  }

  _getIcons(int index) {
    switch (index) {
      case 0:
        return Column(
          children: [
            Image.asset(
              'assets/images/dumble.png',
              width: 60,
            ),
            Text(
              'Muscle Building',
              style: GoogleFonts.robotoFlex(
                  fontSize: 10, fontWeight: FontWeight.bold),
            )
          ],
        );

      case 1:
        return Column(
          children: [
            Image.asset('assets/images/sport.png', width: 60),
            Text(
              'Exercises History',
              style: GoogleFonts.robotoFlex(
                  fontSize: 10, fontWeight: FontWeight.bold),
            )
          ],
        );
      case 2:
        return Column(
          children: [
            Image.asset('assets/images/Calendar.png', width: 60),
            Text(
              'Exercises History',
              style: GoogleFonts.robotoFlex(
                  fontSize: 10, fontWeight: FontWeight.bold),
            )
          ],
        );
      // return Image.asset('assets/images/sport.png');
      case 3:
        //return Image.asset('assets/images/walk.png');
        return Column(
          children: [
            Image.asset('assets/images/Graph.png', width: 60),
            Text(
              'CalorieBurn Chart',
              style: GoogleFonts.robotoFlex(
                  fontSize: 10, fontWeight: FontWeight.bold),
            )
          ],
        );
      default:
        return Image.asset('assets/images/dumble.png');
    }
  }

  DateTime? _lastPressed;
  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (_lastPressed == null ||
        now.difference(_lastPressed!) > Duration(seconds: 2)) {
      _lastPressed = now;
      return false;
    } else {
      return await _showExitDialog() ?? false;
    }
  }

  Future<bool?> _showExitDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit'),
          content: const Text('Do you want to exit trackPro app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                SystemNavigator.pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvide = Provider.of<ThemeProvider>(context);
    final workoutData = Provider.of<WorkoutData>(context);

    _gotToExercises(int index) {
      switch (index) {
        case 0:
          return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (ctx) => WorkoutLowerBoddy()),
              (Route) => false);
        case 1:
          return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (ctx) => WorkoutCore()),
              (Route) => false);
        case 2:
          return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (ctx) => WorkoutCardio()),
              (Route) => false);
      }
    }

    return Consumer<WorkoutData>(
      builder: (context, value, child) => Stack(
        children: [
          WillPopScope(
            onWillPop: _onWillPop,
            child: Stack(
              children: [
                Scaffold(
                  // appBar: AppBar(
                  //   title: Text(
                  //     'Workout',
                  //     style: GoogleFonts.roboto(
                  //         fontSize: 30, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  body: Padding(
                    padding: const EdgeInsets.only(top: 108.0),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 350,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index1) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: _getColorForIndex(index1),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        )
                                      ]),
                                  child: InkWell(
                                    onTap: () {
                                      //_goToexerciseForIndex(index1);
                                    },
                                    child: Center(
                                      child: _getIcons(index1),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: value.getWorkoutList().length,
                            itemBuilder: (context, index) {
                              String selectedWorkoutName =
                                  workoutData.getWorkoutNames()[index];

                              final workout = value.getWorkoutList()[index];
                              return ListTile(
                                title: Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _gotToExercises(index);
                                      },
                                      child: Container(
                                        width: 350,
                                        height: 147,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: _getColorForIndex(index),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 20),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    workout.name,
                                                    style: themeProvide
                                                            .isDarkMode
                                                        ? GoogleFonts
                                                            .robotoFlex(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black)
                                                        : GoogleFonts
                                                            .robotoFlex(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                  ),
                                                  sizedbox(index),
                                                  Text(
                                                    '${value.getExercisesForWorkout(selectedWorkoutName).length} exercises',
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 19,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    value.workoutList[index]
                                                        .image,
                                                    width: 90,
                                                    height: 90,
                                                  ),
                                                  SizedBox(width: 130),
                                                  IconButton(
                                                    onPressed: () {
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (ctx) => Workout()));
                                                      _gotToExercises(index);
                                                    },
                                                    icon: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: themeProvide
                                                              .isDarkMode
                                                          ? Colors.black
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Positioned(
                                    //   top: 90,
                                    //   left: 30,
                                    //   // child: Container(
                                    //   //   width: 110,
                                    //   //   height: 40,
                                    //   //   decoration: const BoxDecoration(
                                    //   //     borderRadius: BorderRadius.all(
                                    //   //       Radius.circular(30),
                                    //   //     ),
                                    //   //     color: Colors.white,
                                    //   //   ),
                                    //   //   child: Center(
                                    //   //     child: Row(
                                    //   //       children: [
                                    //   //         Icon(
                                    //   //           Icons.access_time_filled_outlined,
                                    //   //           color: themeProvide.isDarkMode
                                    //   //               ? Colors.black
                                    //   //               : Colors.grey,
                                    //   //         ),
                                    //   //         const SizedBox(width: 5),
                                    //   //         Text(
                                    //   //           '${workout.exercise.map((e) => e.timer).reduce((a, b) => a + b)} min',
                                    //   //           style: TextStyle(
                                    //   //             color: themeProvide.isDarkMode
                                    //   //                 ? Colors.black
                                    //   //                 : Colors.grey,
                                    //   //           ),
                                    //   //         ),
                                    //   //       ],
                                    //   //     ),
                                    //   //   ),
                                    //   // ),
                                    // ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 50,
                  child: Text(
                    'Workout',
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => Caloriesburnedperexercise()));
              },
              icon: FaIcon(
                FontAwesomeIcons.fire,
                color: themeProvide.isDarkMode
                    ? Colors.red
                    : const Color(0xffffdd7f),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
