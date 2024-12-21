import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/provider/steps.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/provider/userdata.dart';

class StepsCalories extends StatefulWidget {
  const StepsCalories({super.key});

  @override
  State<StepsCalories> createState() => _StepsCaloriesState();
}

class _StepsCaloriesState extends State<StepsCalories> {
  int _elapsedTime = 0;

  String _formatTime(int elapsedTime) {
    int hours = elapsedTime ~/ 3600;
    int minutes = elapsedTime ~/ 60;
    int seconds = elapsedTime % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void stopTheCounter(Steps stepsProvider) {
    uploadData().then((_) {
      stepsProvider.resetSteps();
      stepsProvider.stopCounting();
      // showDialog();
    });
  }

  void showDialog() {
    final DateTime currentDate = DateTime.now();
    final userId = Provider.of<UserData>(context, listen: false).userId;

    ;

    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SizedBox(
            width: 700,
            height: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 98.0),
                  child: Row(
                    children: [
                      Image.asset('assets/images/fire.gif'),
                    ],
                  ),
                ),
                Text(
                  "You burned ${Provider.of<Steps>(context, listen: false).burnedCalories} calories!",
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Row(
                    children: [],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130.0),
                  child: Row(
                    children: [],
                  ),
                )
              ],
            ),
          );
        });
  }

  void pause() {
    Provider.of<Steps>(context, listen: false).pauseCounting();
  }

  void resume() {
    Provider.of<Steps>(context, listen: false).resumeCounting();
  }

  Future<void> uploadData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    if (userId == null) {
      print('User ID not found in SharedPreferences.');
      return;
    }

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      CollectionReference stepsCollection =
          firestore.collection('users').doc(userId).collection('steps');

      await stepsCollection.add({
        'steps': (Provider.of<Steps>(context, listen: false).steps / 3).floor(),
        'caloriesBurned':
            Provider.of<Steps>(context, listen: false).burnedCalories.round(),
        'duration': _elapsedTime,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Steps, calories, and duration uploaded successfully!');
    } catch (e) {
      print('Error uploading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    final stepsProvider = Provider.of<Steps>(context);

    _elapsedTime = stepsProvider.duration;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 495,
                height: 248,
                decoration: BoxDecoration(
                    color: themeProvider1.isDarkMode
                        ? Color(0xffffce48)
                        : Color(0xffffce48),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(56),
                        bottomRight: Radius.circular(44))),
              ),
            ],
          ),
          Positioned(
            left: 20,
            top: 40,
            child: Text('Calories And Steps',
                style: GoogleFonts.roboto(
                    color: themeProvider1.isDarkMode
                        ? Colors.white
                        : Color(0xff574619),
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ),
          Positioned(
            left: 59,
            top: 180,
            child: Container(
              width: 262,
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xfff3f3f3).withOpacity(0.6),
                    spreadRadius: 20,
                    blurRadius: 1,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Text('Steps',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: const Color(0xFF575757),
                              )),
                          const SizedBox(width: 60),
                          Text(
                            '${(stepsProvider.steps / 3).floor()}',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text('step',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      const SizedBox(height: 60),
                      Row(
                        children: [
                          Text('Calories ',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: const Color(0xFF575757),
                              )),
                          const SizedBox(width: 30),
                          Text(
                            '${stepsProvider.burnedCalories.round()}',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text('calorie',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset('assets/images/distance.png'),
                                const SizedBox(height: 3),
                                Text(
                                  '${stepsProvider.strideLength.toStringAsFixed(2)}',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset('assets/images/fire.png'),
                                Text(
                                  '${stepsProvider.burnedCalories.round()}',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset('assets/images/time.png'),
                                Text(
                                  _formatTime(_elapsedTime),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      stepsProvider.isCounting
                          ? Row(
                              children: [
                                IconButton(
                                  onPressed:
                                      stepsProvider.isPaused ? resume : pause,
                                  icon: Icon(
                                    stepsProvider.isPaused
                                        ? Icons.play_arrow_rounded
                                        : Icons.pause,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    stopTheCounter(stepsProvider);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: themeProvider1.isDarkMode
                                          ? Color(0xffffce48)
                                          : const Color(0xFF4a4d7a)),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Text(
                                      'Stop',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : ElevatedButton(
                              onPressed: () {
                                stepsProvider.startCounting();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: themeProvider1.isDarkMode
                                      ? Color(0xffffce48)
                                      : const Color(0xFF4a4d7a)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.0),
                                child: Text(
                                  'Start',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 30,
          //   right: 20,
          //   child: Column(
          //     children: [
          //       IconButton(
          //         onPressed: () {
          //           setState(() {
          //             stepsProvider.resetSteps();
          //           });
          //         },
          //         icon: themeProvider1.isDarkMode
          //             ? Icon(
          //                 Icons.restart_alt,
          //                 color: Colors.black,
          //               )
          //             : Icon(Icons.restart_alt),
          //       ),
          //       Text(
          //         'Restart Counter',
          //         style: themeProvider1.isDarkMode
          //             ? TextStyle(fontSize: 10, color: Colors.black)
          //             : TextStyle(fontSize: 10),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
