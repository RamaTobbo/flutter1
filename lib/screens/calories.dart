import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/steps.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math';

import 'package:track_pro/provider/userdata.dart';

var userProviderHeight1;

class Calories extends StatefulWidget {
  const Calories({super.key});

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  double _steps = 0;
  double _previousMagnitude = 0.0;
  double _burnedCalories = 0;
  double _distance = 0;
  double _strideLength = 0;
  final double _threshold = 1.9;
  bool isStartPressed = false;
  // void restartCounter() {
  //   setState(() {
  //     _steps = 0;
  //     _previousMagnitude = 0.0;
  //     _burnedCalories = 0;
  //     _strideLength = 0;
  //     _distance = 0;
  //   });
  // }

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
  void initState() {
    super.initState();
  }

  void stopTheCounter(Steps stepsProvider) {
    _accelerometerSubscription?.cancel();
    stepsProvider.stopCounting();
    _accelerometerSubscription = null;
    stepsProvider.stopCounting();
    setState(() {
      isStartPressed = false;
    });
  }

  Widget build(BuildContext context) {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    final stepsProvider = Provider.of<Steps>(context);

    userProviderHeight1 = Provider.of<UserData>(context).height;
    _strideLength = (userProviderHeight1! * 0.415) / 100;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                            Text(
                              'Steps',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: const Color(0xFF575757),
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Text(
                              '${stepsProvider.steps}',
                              style: themeProvider1.isDarkMode
                                  ? GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
                                  : GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              'step',
                              style: themeProvider1.isDarkMode
                                  ? GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)
                                  : GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          children: [
                            Text(
                              'Calories ',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: const Color(0xFF575757),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              '${stepsProvider.burnedCalories.round()}',
                              style: themeProvider1.isDarkMode
                                  ? GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
                                  : GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              'calorie',
                              style: themeProvider1.isDarkMode
                                  ? GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)
                                  : GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/distance.png'),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                          '${stepsProvider.strideLength.toStringAsFixed(2)}',
                                          style: themeProvider1.isDarkMode
                                              ? GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)
                                              : TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/fire.png'),
                                    Text(
                                        '${stepsProvider.burnedCalories.round()}',
                                        style: themeProvider1.isDarkMode
                                            ? GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)
                                            : TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/time.png'),
                                      Text(
                                        'result',
                                        style: themeProvider1.isDarkMode
                                            ? GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)
                                            : const TextStyle(
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 22.0),
                          child: stepsProvider.isCounting
                              ? ElevatedButton(
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
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    stepsProvider.startCounting();
                                    // beginTheCounter(stepsProvider);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: themeProvider1.isDarkMode
                                          ? Color(0xffffce48)
                                          : const Color(0xFF4a4d7a)),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Text(
                                      'Start',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
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
                top: 30,
                right: 20,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            stepsProvider.resetSteps();
                          });
                        },
                        icon: themeProvider1.isDarkMode
                            ? Icon(
                                Icons.restart_alt,
                                color: Colors.black,
                              )
                            : Icon(Icons.restart_alt)),
                    Text(
                      'Restart Counter',
                      style: themeProvider1.isDarkMode
                          ? TextStyle(fontSize: 10, color: Colors.black)
                          : TextStyle(fontSize: 10),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
