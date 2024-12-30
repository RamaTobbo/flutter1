import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/provider/steps.dart';
import 'package:track_pro/provider/userdata.dart';

class Steps1 extends StatefulWidget {
  const Steps1({super.key});

  @override
  State<Steps1> createState() => _Steps1State();
}

class _Steps1State extends State<Steps1> {
  int _elapsedTime = 0;
  bool _isCounting = false; // Tracks whether the timer is running
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    fetchUserInformation();
  }

  // Fetch the user information from Firestore
  Future<void> fetchUserInformation() async {
    try {
      // Get the user ID from provider or SharedPreferences
      String userId = Provider.of<UserData>(context, listen: false).userId;

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        setState(() {
          height = snapshot['height'];
          weight = snapshot['weight'];

          // Update the weight in Firebase Realtime Database
          updateWeightInRealtimeDB(weight);
        });
      } else {
        debugPrint("No user found for the given ID.");
      }
    } catch (e) {
      debugPrint("Error fetching user information: $e");
    }
  }

  // Update weight in Firebase Realtime Database in real-time
  void updateWeightInRealtimeDB(int weight) {
    // Set the weight value in the 'sensors' node of the Realtime Database
    _databaseRef.child('sensors').update({
      'weight': weight, // Upload the weight to the sensors node
    }).then((_) {
      print("Weight updated successfully in Firebase Realtime Database.");
    }).catchError((error) {
      print("Error updating weight in Realtime Database: $error");
    });
  }

  int weight = 0;
  int height = 0;
  double calories = 0;
  int steps = 0;
  double distance = 0;

  Future<void> uploadData(int stepss, double caloriess) async {
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
        'steps': stepss,
        'caloriesBurned': caloriess,
        'duration': _elapsedTime,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Steps, calories, and duration uploaded successfully!');
    } catch (e) {
      print('Error uploading data: $e');
    }
  }

  void _fetchData() {
    _databaseRef.child('sensors').onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          // Fetch steps as an integer, if it's a double convert it
          steps = data['steps'] is int
              ? data['steps']
              : (data['steps'] as double?)?.toInt();

          // Fetch calories as a double, if it's stored as a double
          if (data['calories'] is double) {
            calories = data['calories'] as double;
          } else if (data['calories'] is int) {
            calories = data['calories']
                as double; // Convert it to double if it's stored as an int
          }
        });
      }
      distance = steps! * 0.4; //stride length
    });
  }

  String _formatTime(int elapsedTime) {
    int hours = elapsedTime ~/ 3600;
    int minutes = elapsedTime ~/ 60;
    int seconds = elapsedTime % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // Start the counting timer
  void _startCounting() {
    setState(() {
      _isCounting = true;
    });
    // Trigger the database update to start counting steps
    DatabaseReference ref = FirebaseDatabase.instance.ref('sensors');
    ref.update({
      'startStepsCounting': true,
    });
    _fetchData(); // Fetch data when starting
  }

  // Stop the counting timer
  void _stopCounting() {
    setState(() {
      _isCounting = false;
    });
    // Trigger the database update to stop counting steps
    DatabaseReference ref = FirebaseDatabase.instance.ref('sensors');
    ref.update({
      'startStepsCounting': false,
    });
    uploadData(steps, calories);

    calories = 0.0;
    steps = 0;
    distance = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                  width: 495,
                  height: 248,
                  decoration: BoxDecoration(
                      color: Color(0xffffce48),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(56),
                          bottomRight: Radius.circular(44)))),
            ],
          ),
          Positioned(
            left: 20,
            top: 40,
            child: Text('Calories And Steps',
                style: GoogleFonts.roboto(
                    color: Colors.black,
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
                            '${steps ?? 0}', // Display steps or 0 if null
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
                          Text('Calories',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: const Color(0xFF575757),
                              )),
                          const SizedBox(width: 30),
                          Text(
                            '${calories ?? 0}', // Display calories or 0 if null
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text('calories',
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
                                  '${distance!.toStringAsFixed(2)}', // Placeholder for stride length
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
                                  '${calories}', // Placeholder for burned calories
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
                                  _formatTime(_elapsedTime), // Timer display
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
                      _isCounting
                          ? ElevatedButton(
                              onPressed: _stopCounting,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF4a4d7a),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.0),
                                child: Text(
                                  'Stop',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: _startCounting,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF4a4d7a)),
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
        ],
      ),
    );
  }
}
