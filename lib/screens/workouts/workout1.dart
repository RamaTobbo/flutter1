import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/noSmartwatch/Home.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/provider/userdata.dart';
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
  bool isgoingback = true;
  bool userNotUsingSmartWatch = true;

  Future<bool> fetchUserUsingSmartWatch(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUserId = prefs.getString('userId');
      Provider.of<UserData>(context, listen: false).setUserId(storedUserId!);
      print('idddd${storedUserId}');
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(storedUserId)
          .get();

      if (snapshot.exists) {
        debugPrint("Fetched user dataaaaa: ${snapshot.data()}");

        userNotUsingSmartWatch = snapshot['IsNotAsmartwatchUser'] ?? true;

        if (snapshot.data() != null) {
          if (mounted) {
            setState(() {
              userNotUsingSmartWatch = snapshot['IsNotAsmartwatchUser'] ?? true;
            });
          }
        } else {
          debugPrint("Field 'IsNotAsmartwatchUser' is missing.");
        }
      } else {
        debugPrint("No user found for the given ID.");
      }
    } catch (e) {
      debugPrint("Error fetching user information: $e");
    }
    return userNotUsingSmartWatch;
  }

  @override
  Widget build(BuildContext context) {
    final workoutData = Provider.of<WorkoutData>(context);
    UserWithSmartWatch =
        Provider.of<Isasmartwatchuser>(context).isNotUsingSmartwatch;
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
            PopScope(
              canPop: false,
              child: Scaffold(
                appBar: AppBar(
                  title: Padding(
                    padding: EdgeInsets.only(left: 48),
                    child: Text(
                      'Lower Body',
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
            ),
            Positioned(
              top: 30,
              child: IconButton(
                onPressed: () async {
                  bool isNotUsingSmartWatch =
                      await fetchUserUsingSmartWatch(context);

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => isNotUsingSmartWatch
                          ? TabNav1(index: 3)
                          : TabNav(index: 3),
                    ),
                    (Route) => true,
                  );
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
