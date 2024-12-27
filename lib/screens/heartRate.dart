import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/themeprovider.dart';

class Heartrate extends StatefulWidget {
  const Heartrate({super.key});

  @override
  State<Heartrate> createState() => _HeartrateState();
}

class _HeartrateState extends State<Heartrate> {
  var heartRate1 = 59;
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
          heartRate = (data['heartRate'] as double).round();
          // humidity = data['humidity'];
          // pressure = data['pressure'];
          // temperature = data['temperature'];
        });
      }
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchSensorData();
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
  @override
  Widget build(BuildContext context) {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    return PopScope(
      canPop: false,
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: 388,
                    height: 350,
                    decoration: BoxDecoration(
                      color: themeProvider1.isDarkMode
                          ? Colors.red
                          : const Color(0xFFf9e0e4),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(110),
                        bottomRight: Radius.circular(110),
                      ),
                    ),
                  ),
                  Container(
                    width: 316,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(23)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xfff3f3f3).withOpacity(0.6),
                          spreadRadius: 12,
                          blurRadius: 1,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Image.asset(
                                    'assets/images/heartpulse.png',
                                    width: 90),
                              ),
                              const SizedBox(width: 13),
                              Text('${heartRate}',
                                  style: GoogleFonts.roboto(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 2,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  'bpm',
                                  style: TextStyle(color: Color(0xFF696969)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 16,
                          child: heartRate! >= 60 && heartRate! <= 100
                              ? Text(
                                  'Normal',
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFF696969)),
                                )
                              : Text(
                                  'Abnormal',
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFF696969)),
                                ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 63,
                  ),
                  Container(
                    width: 316,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(23)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xfff3f3f3).withOpacity(0.6),
                          spreadRadius: 12,
                          blurRadius: 1,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Image.asset('assets/images/pulseoximeter.png'),
                              const SizedBox(width: 13),
                              Text('Oxygen',
                                  style: GoogleFonts.roboto(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text('oxygenres'),
                              const Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  '%',
                                  style: TextStyle(color: Color(0xFF696969)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 16,
                          child: heartRate1 >= 60 && heartRate1 <= 100
                              ? Text(
                                  'Normal',
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFF696969)),
                                )
                              : Text(
                                  'Abnormal',
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFF696969)),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 80,
                left: 40,
                child: Text(
                  'Heart Rate',
                  style: themeProvider1.isDarkMode
                      ? GoogleFonts.roboto(fontSize: 24, color: Colors.white)
                      : GoogleFonts.roboto(
                          fontSize: 24,
                          color: const Color(0xff554c4e),
                        ),
                ),
              ),
              Positioned(
                top: 130,
                left: 80,
                child: Image.asset(
                  'assets/images/pulse.png',
                  width: 200,
                  height: 200,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
