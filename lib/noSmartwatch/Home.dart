import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/models/weather.dart';
import 'package:track_pro/provider/steps.dart';
import 'package:track_pro/provider/temp.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/heartRate.dart';

import 'package:track_pro/services/weather.dart';
import 'package:track_pro/widgets/chatbot.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _weatherService = WeatherService('f8f10eafbcae3f86eabf5628da94f88a');
  Weather _weather = Weather();
  int height = 0;
  int weight = 0;
  double? userBmi;
  int steps = 0;
  DateTime? _lastPressed;
  void _fetchLastStepCount() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    if (userId != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      try {
        QuerySnapshot snapshot = await firestore
            .collection('users')
            .doc(userId)
            .collection('steps')
            .orderBy('timestamp', descending: true)
            .limit(1)
            .get();

        if (snapshot.docs.isNotEmpty) {
          var lastStepDoc = snapshot.docs.first;
          var lastSteps = lastStepDoc['steps'];

          double steps =
              (lastSteps is int) ? lastSteps.toDouble() : lastSteps ?? 0.0;
        }
      } catch (e) {
        print('Error fetching last step count: $e');
      }
    }
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

  _fetchWeather() async {
    try {
      Location location = Location();
      LocationData locationData = await location.getLocation();
      final weather = await _weatherService.getWeatherByCoordinates(
        locationData.latitude!,
        locationData.longitude!,
      );
      print('Weather fetched: ${weather.temperature}°C');
      setState(() {
        _weather = weather;
      });
      Provider.of<temp>(context, listen: false)
          .setHumidity(weather.Humidity.round());
      Provider.of<temp>(context, listen: false)
          .setHumidity(weather.temperature.round());
      Provider.of<temp>(context, listen: false)
          .setCondition(weather.mainCondition);
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchLastStepCount();
    _fetchWeather();
    _loadUserId();
    fetchUserInformation(context);
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
    final stepProvider = Provider.of<Steps>(context);

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
                        padding: const EdgeInsets.only(right: 198.0, top: 90),
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
                          child: Container(
                            width: 345,
                            height: 146,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF8183a2),
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
                                      'assets/images/Step.png',
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18.0),
                                      child: Text('Steps',
                                          style: themeProvider1.isDarkMode
                                              ? GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold)
                                              : GoogleFonts.roboto(
                                                  color:
                                                      const Color(0xFF2c2d37),
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 98.0),
                                  child: Row(
                                    children: [
                                      Text('${stepProvider.steps}',
                                          style: themeProvider1.isDarkMode
                                              ? GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 29,
                                                  fontWeight: FontWeight.bold)
                                              : GoogleFonts.roboto(
                                                  fontSize: 29,
                                                  fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text('step',
                                            style: themeProvider1.isDarkMode
                                                ? GoogleFonts.roboto(
                                                    color: Colors.black,
                                                  )
                                                : GoogleFonts.roboto(
                                                    color: const Color(
                                                        0xFF675c5e))),
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
                            const SizedBox(
                              width: 7,
                            ),
                            InkWell(
                              child: Container(
                                width: 345,
                                height: 146,
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
                                          style: themeProvider1.isDarkMode
                                              ? GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold)
                                              : GoogleFonts.roboto(
                                                  color:
                                                      const Color(0xFF574b2b),
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        bmiCategory == 'UnderWeight' ||
                                                bmiCategory == 'OverWeight'
                                            ? SizedBox(width: 36)
                                            : SizedBox(width: 66),
                                        Text('${bmiCategory}',
                                            style: GoogleFonts.roboto(
                                                color: const Color(0xFF3e4445),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 90.0, top: 20),
                                      child: Row(
                                        children: [
                                          Text('${bmi.toStringAsFixed(2)}',
                                              style: themeProvider1.isDarkMode
                                                  ? GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontSize: 29,
                                                      fontWeight:
                                                          FontWeight.bold)
                                                  : GoogleFonts.roboto(
                                                      fontSize: 29,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text('kg/m²',
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 34),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 345,
                            height: 146,
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
                                        style: themeProvider1.isDarkMode
                                            ? GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold)
                                            : GoogleFonts.roboto(
                                                color: const Color(0xFF3e4445),
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text('${_weather!.mainCondition}',
                                        style: GoogleFonts.roboto(
                                            color: const Color(0xFF3e4445),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 107.0),
                                  child: Row(
                                    children: [
                                      Text(
                                          _weather != null
                                              ? '${_weather?.temperature.round()}°C'
                                              : 'Loading...',
                                          style: themeProvider1.isDarkMode
                                              ? GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 29,
                                                  fontWeight: FontWeight.bold)
                                              : GoogleFonts.roboto(
                                                  fontSize: 29,
                                                  fontWeight: FontWeight.bold)),
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
            top: 70,
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
