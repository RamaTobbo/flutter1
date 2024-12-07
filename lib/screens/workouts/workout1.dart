import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:track_pro/noSmartwatch/tab.dart';

import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/provider/userdata.dart';

import 'package:track_pro/screens/exercises/exercise.dart';

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
  String WorkoutName = "";
  List<String> WorkoutExercises = [];
  List<String> WorkoutGifImages = [];
  List<String> WorkoutImages = [];
  List<String> videotutorial = [];
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
  void initState() {
    super.initState();
    fetchLowerBody(context);
    fetchLowerBodyExercises(context);
  }

  // Fetch workout name
  void fetchLowerBody(BuildContext context) async {
    try {
      QuerySnapshot workoutNameSnapshot = await FirebaseFirestore.instance
          .collection('Workouts')
          .doc('oP1kIzPEgMdCspN1pFYy')
          .collection('exercises')
          .where('name', isEqualTo: 'Lower Body')
          .get();

      if (workoutNameSnapshot.docs.isNotEmpty) {
        workoutNameSnapshot.docs.forEach((exerciseDoc) {
          String fetchedWorkoutName = exerciseDoc['name'] ?? 'No name';

          if (mounted) {
            setState(() {
              WorkoutName = fetchedWorkoutName;
            });
          }

          debugPrint('Exercise: $WorkoutName');
        });
      }
    } catch (e) {
      debugPrint("Error fetching exercises: $e");
    }
  }

  // Fetch lower body exercises and their images
  void fetchLowerBodyExercises(BuildContext context) async {
    try {
      QuerySnapshot lowerBodySnapshot = await FirebaseFirestore.instance
          .collection('Workouts')
          .doc('oP1kIzPEgMdCspN1pFYy')
          .collection('exercises')
          .doc('vImPanVomRxVosRKsDRo')
          .collection('LowerBody')
          .get();

      if (lowerBodySnapshot.docs.isNotEmpty) {
        lowerBodySnapshot.docs.forEach((exerciseDoc) {
          String fetchedExerciseName = exerciseDoc['exerciseName'] ?? 'No name';
          String fetchedExerciseSubImage =
              exerciseDoc['subImage'] ?? 'No image';
          String fetchedExerciseGifImage =
              exerciseDoc['exerciseImage'] ?? 'No image';
          String tutorial = exerciseDoc['videotutorial'] ?? 'No image';
          if (mounted) {
            setState(() {
              WorkoutExercises.add(fetchedExerciseName);
              WorkoutImages.add(fetchedExerciseSubImage);
              WorkoutGifImages.add(fetchedExerciseGifImage);
              videotutorial.add(tutorial);
            });
          }

          debugPrint(
              'Exercise Name: $fetchedExerciseName, Image: $fetchedExerciseSubImage');
        });
      } else {
        debugPrint('No exercises found in the Cardio subcollection.');
      }
    } catch (e) {
      debugPrint("Error fetching exercises: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvide = Provider.of<ThemeProvider>(context);

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 48),
            child: Text(
              '$WorkoutName',
              style: GoogleFonts.roboto(
                  color: themeProvide.isDarkMode ? Colors.white : Colors.black),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: WorkoutExercises.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Stack(
                children: [
                  Container(
                    width: 350,
                    height: 107,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xfff9e0e4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 20),
                      child: Text(
                        WorkoutExercises[index], // Exercise name
                        style: GoogleFonts.robotoFlex(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
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
                            builder: (ctx) => Exercisess(
                              animationImage: WorkoutGifImages[index],
                              exerciseName: WorkoutExercises[index],
                              videoTutorial: videotutorial[index],
                              workoutName: WorkoutName,

                              nextExerciseRoute:
                                  "", // Handle next route if needed
                            ),
                          ),
                          (route) =>
                              false, // This removes all routes until the new one
                        );
                        // if (WorkoutExercises[index] == "Cycling") {
                        //   Navigator.pushAndRemoveUntil(
                        //       context,
                        //       MaterialPageRoute(builder: (ctx) => Bicycle()),
                        //       (Route) => false);
                        // } else if (WorkoutExercises[index] == "Walking") {
                        //   Navigator.pushAndRemoveUntil(
                        //       context,
                        //       MaterialPageRoute(builder: (ctx) => Walking()),
                        //       (Route) => false);
                        // } else if (WorkoutExercises[index] == "Jumping Jacks") {
                        //   Navigator.pushAndRemoveUntil(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (ctx) => Jumpingjacks()),
                        //       (Route) => false);
                        // } else if (WorkoutExercises[index] == "Burpees") {
                        //   Navigator.pushAndRemoveUntil(
                        //       context,
                        //       MaterialPageRoute(builder: (ctx) => Burpees()),
                        //       (Route) => false);
                        // }
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
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                      ),
                      child: Image.asset(WorkoutImages[index]),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      Positioned(
        top: 30,
        child: IconButton(
          onPressed: () async {
            bool isNotUsingSmartWatch = await fetchUserUsingSmartWatch(context);

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (ctx) =>
                    isNotUsingSmartWatch ? TabNav1(index: 3) : TabNav(index: 3),
              ),
              (Route) => true,
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      )
    ]);
  }
}
