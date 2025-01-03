import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:track_pro/DataHistory/stepsCalendar.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/CaloriesBurnedPerExercise.dart';
import 'package:track_pro/screens/tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:track_pro/noSmartwatch/tab.dart';

class Caloriesburnedfromsteps extends StatefulWidget {
  const Caloriesburnedfromsteps({super.key});

  @override
  State<Caloriesburnedfromsteps> createState() =>
      _CaloriesburnedfromstepsState();
}

class _CaloriesburnedfromstepsState extends State<Caloriesburnedfromsteps> {
  DateTime now = DateTime.now();
  double totalBurnedCaloriesFromSteps = 0.0;
  List<Map<String, dynamic>> stepsDataList = [];
  bool userNotUsingSmartWatch = true;

  Future<void> fetchStepsData() async {
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
      QuerySnapshot snapshot = await stepsCollection
          .where('timestamp',
              isGreaterThanOrEqualTo: DateTime(now.year, now.month, now.day))
          .where('timestamp',
              isLessThan: DateTime(now.year, now.month, now.day + 1))
          .get();

      double totalCalories = 0.0;
      for (var doc in snapshot.docs) {
        var caloriesBurnedData = doc['caloriesBurned'] ?? 0.0;

        totalCalories += caloriesBurnedData;
        var stepsData = doc['steps'] ?? 0;
        var durationData = doc['duration'] ?? 0;
        var timestampData = doc['timestamp'] ?? DateTime.now();

        if (caloriesBurnedData != 0 && stepsData != 0) {
          stepsDataList.add({
            'steps': stepsData,
            'caloriesBurned': caloriesBurnedData,
            'duration': durationData,
            'timestamp': timestampData,
          });
        }
      }

      setState(() {
        totalBurnedCaloriesFromSteps = totalCalories;
      });
    } catch (e) {
      print('Error fetching steps data: $e');
    }
  }

  Future<bool> fetchUserUsingSmartWatch(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUserId = prefs.getString('userId');
      Provider.of<UserData>(context, listen: false).setUserId(storedUserId!);

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(storedUserId)
          .get();

      if (snapshot.exists) {
        userNotUsingSmartWatch = snapshot['IsNotAsmartwatchUser'] ?? true;
      }
    } catch (e) {
      debugPrint("Error fetching user information: $e");
    }
    return userNotUsingSmartWatch;
  }

  @override
  void initState() {
    super.initState();
    fetchStepsData();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, M/d/y').format(now);

    final isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    double totalCaloriesBurned = totalBurnedCaloriesFromSteps;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Text('Burned Calories'),
            ),
          ),
          body: stepsDataList.isEmpty
              ? const Center(child: Text("No steps recorded."))
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Steps Total Burned Calories: ${totalCaloriesBurned.toStringAsFixed(2)} cal',
                        style: GoogleFonts.robotoSlab(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(18.0),
                        itemCount: stepsDataList.length,
                        itemBuilder: (context, index) {
                          var data = stepsDataList[index];
                          final steps = data['steps'] ?? 0;
                          final caloriesBurned = data['caloriesBurned'] ?? 0;
                          final duration = data['duration'] ?? 0;
                          final timestamp = data['timestamp'];

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              width: 330,
                              height: 130,
                              decoration: BoxDecoration(
                                color: const Color(0xffffdd7f),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 78.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          formattedDate,
                                          style: GoogleFonts.robotoSlab(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          'Steps: $steps',
                                          style: GoogleFonts.robotoSlab(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/fire.gif',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${caloriesBurned.toStringAsFixed(2)} cal',
                                        style: GoogleFonts.robotoSlab(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Duration: ${duration.toString()} sec',
                                        style: GoogleFonts.robotoSlab(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        Positioned(
          top: 30,
          right: 30,
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const StepsCalendar()));
            },
            icon: const Icon(Icons.calendar_month),
          ),
        ),
        Positioned(
          top: 30,
          right: 80,
          child: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (ctx) => const Caloriesburnedperexercise()),
                (Route route) => false,
              );
            },
            icon: const Icon(Icons.fitness_center),
            iconSize: 30,
          ),
        ),
      ],
    );
  }
}
