import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/heartRate.dart';
import 'package:track_pro/widgets/chatbot.dart';
import 'package:track_pro/screens/connectAgain.dart';
import 'package:track_pro/provider/sensorsData.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

  int? heartRate;
  int? humidity;
  int? pressure;
  int? temperature;
  void _fetchSensorData() {
    _databaseRef.child('sensors').onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          // Check if the heartRate is a double, then convert it to int, or cast it directly if it's an int
          if (data['heartRate'] is double) {
            heartRate = (data['heartRate'] as double)
                .toInt(); // Convert to int if it's a double
          } else if (data['heartRate'] is int) {
            heartRate = data['heartRate']
                as int; // Directly assign if it's already an int
          }
        });
      }
    });
  }

  int height = 0; // In cm
  int weight = 0;
  String receivedTime = "No time yet"; // Variable to store the received time
  String receivedPressure = "No pressure yet";
  String receivedTemperature = "No temperature yet";
  String receivedHumidity = "No humidity yet";
  bool isBluetoothOn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchSensorData();
    _checkBluetoothStatus();
    loadReceivedData();
    _loadUserId();
    fetchUserInformation(context);
  }

  void _checkBluetoothStatus() async {
    FlutterBluePlus flutterBlue = FlutterBluePlus();

    // Check if Bluetooth is powered on
    bool isOn = await FlutterBluePlus.isOn;
    if (!isOn) {
      // If Bluetooth is off, navigate to the ConnectPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Connectagain()),
      );
    } else {
      setState(() {
        isBluetoothOn = true; // Bluetooth is on, proceed to main screen
      });
    }
  }

  Future<void> loadReceivedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      receivedTime = prefs.getString('receivedTime') ?? "No time yet";
      receivedPressure =
          prefs.getString('receivedPressure') ?? "No pressure yet";
      receivedTemperature =
          prefs.getString('receivedTemperature') ?? "No temperature yet";
      receivedHumidity =
          prefs.getString('receivedHumidity') ?? "No humidity yet";
    });
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

  void fetchUserInformation(BuildContext context) async {
    try {
      String userId = Provider.of<UserData>(context, listen: false).userId;

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        setState(() {
          height = snapshot['height'];
          weight = snapshot['weight'];

          // Optionally update weightHistory from Firestore
        });
      } else {
        debugPrint("No user found for the given ID.");
      }
    } catch (e) {
      debugPrint("Error fetching user information: $e");
    }
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUserId = prefs.getString('userId');

    if (storedUserId != null) {
      // Set the userId in the UserData provider
      Provider.of<UserData>(context, listen: false).setUserId(storedUserId);
      print("UserId loaded from SharedPreferences: $storedUserId");
    } else {
      print("No userId found in SharedPreferences");
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    double bmi = 0;

    if (height > 0 && weight > 0) {
      bmi = weight / ((height / 100) * (height / 100));
    }
    ;

    String bmiCategory;
    if (bmi < 18.5) {
      bmiCategory = 'UnderWeight';
    } else if (bmi > 18.5 && bmi <= 24.9) {
      bmiCategory = 'Normal';
    } else if (bmi > 15 && bmi <= 29.9) {
      bmiCategory = 'OverWeight';
    } else {
      bmiCategory = 'Obese';
    }
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 178.0, top: 60),
                        child: Text(
                          'Home',
                          style: GoogleFonts.roboto(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 34),
                        child: InkWell(
                          onTap: () {
                            ;
                          },
                          child: Container(
                            width: 415,
                            height: 156,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFf9e0e4),
                              boxShadow: [
                                themeProvider1.isDarkMode
                                    ? BoxShadow(
                                        color: Colors.grey.withOpacity(0.01),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 0),
                                      )
                                    : BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      )
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/Heart.png',
                                    ),
                                    Text('Heart Rate',
                                        style: GoogleFonts.roboto(
                                            color: const Color(0xFF62585a),
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 98.0),
                                  child: Row(
                                    children: [
                                      Text('${heartRate}',
                                          style: GoogleFonts.roboto(
                                              fontSize: 29,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text('bpm',
                                            style: GoogleFonts.roboto(
                                                color:
                                                    const Color(0xFF675c5e))),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            InkWell(
                              child: Container(
                                width: 171,
                                height: 147,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFF8183a2),
                                  boxShadow: [
                                    themeProvider1.isDarkMode
                                        ? BoxShadow(
                                            color:
                                                Colors.grey.withOpacity(0.01),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 0),
                                          )
                                        : BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3),
                                          ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/Step.png',
                                          width: 65,
                                          height: 45,
                                        ),
                                        Text('Steps',
                                            style: GoogleFonts.roboto(
                                                color: const Color(0xFF2c2d37),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 20),
                                      child: Row(
                                        children: [
                                          Text('Result',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 29,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text('step',
                                                style: GoogleFonts.roboto(
                                                    color: const Color(
                                                        0xFF675c5e))),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            InkWell(
                              child: Container(
                                width: 171,
                                height: 147,
                                padding: const EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFFffdd7f),
                                  boxShadow: [
                                    themeProvider1.isDarkMode
                                        ? BoxShadow(
                                            color:
                                                Colors.grey.withOpacity(0.01),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 0),
                                          )
                                        : BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3),
                                          ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/BMI.png',
                                          width: 65,
                                          height: 45,
                                        ),
                                        Text(
                                          'Your BMI',
                                          style: GoogleFonts.roboto(
                                              color: const Color(0xFF574b2b),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 20),
                                      child: Row(
                                        children: [
                                          Text('${bmi.toStringAsFixed(2)}',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 29,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            'kg/m²',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: Text('${bmiCategory}',
                                          style: GoogleFonts.roboto(
                                              color: const Color(0xFF675c5e))),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 34),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 415,
                            height: 156,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFb6c7ca),
                              boxShadow: [
                                themeProvider1.isDarkMode
                                    ? BoxShadow(
                                        color: Colors.grey.withOpacity(0.01),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 0),
                                      )
                                    : BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/weather.png',
                                        width: 107, height: 100),
                                    Text('Weather',
                                        style: GoogleFonts.roboto(
                                            color: const Color(0xFF3e4445),
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 98.0),
                                  child: Row(
                                    children: [
                                      Text('${receivedPressure}${"\u2103"}',
                                          style: GoogleFonts.roboto(
                                              fontSize: 29,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text('',
                                            style: GoogleFonts.roboto(
                                                color:
                                                    const Color(0xFF675c5e))),
                                      )
                                    ],
                                  ),
                                )
                              ],
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
          Positioned(
            top: 60,
            right: 20,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const Chatbot()));
              },
              child: Image.asset(
                'assets/images/chat.png',
                width: 70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
