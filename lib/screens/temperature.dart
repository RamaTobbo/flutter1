import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:track_pro/models/location.dart';
import 'package:track_pro/provider/location.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/screens/map.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key, required this.place});
  final Function place;

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  PlaceLocation? pickedPlace;
  bool isGettingLocation = false;
  String receivedTime = "No time yet";
  String receivedPressure = "No pressure yet";
  String receivedTemperature = "No temperature yet";
  String receivedHumidity = "No humidity yet";

  @override
  void initState() {
    super.initState();
    loadReceivedData();
    _fetchSensorData();
  }

  double humidity = 0;
  double pressure = 0;
  double temperature = 0;
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

  void _fetchSensorData() {
    _databaseRef.child('sensors').onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          if (data['temperature'] is double) {
            temperature = data['temperature'];
          } else if (data['temperature'] is int) {
            temperature = (data['temperature'] as int).toDouble();
          }
          if (data['pressure'] is double) {
            pressure = data['pressure'];
          } else if (data['pressure'] is int) {
            pressure = (data['pressure'] as int).toDouble();
          }
          if (data['humidity'] is double) {
            humidity = data['humidity'];
          } else if (data['humidity'] is int) {
            humidity = (data['humidity'] as int).toDouble();
          }
          print('temp:${temperature}');
        });
      }
    });
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
    print('hum:${receivedHumidity}');
  }

  void getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      isGettingLocation = true;
    });

    locationData = await location.getLocation();
    double longitude = locationData.longitude!.toDouble();
    double latitude = locationData.latitude!.toDouble();

    Provider.of<location1>(context, listen: false).setLatitude(latitude);
    Provider.of<location1>(context, listen: false).setLongitude(longitude);

    if (longitude == null || latitude == null) {
      setState(() {
        isGettingLocation = false;
      });
      return;
    }

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyA664j9QIT6aPfNHPtMG9yKEM0Qx89RYVM');
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address = resData['results'][0]['formatted_address'];

    setState(() {
      pickedPlace =
          PlaceLocation(long: longitude, lat: latitude, address: address);
      isGettingLocation = false;
    });

    if (pickedPlace != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MapScreen(
                location: pickedPlace!,
                isSelecting: false,
              )));
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
          content: const Text('Do you want to exit the TrackPro app?'),
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

  final textstyle =
      GoogleFonts.roboto(fontSize: 20, color: const Color(0xff575757));
  final resultstyle =
      GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: RoundedBottomClipper(),
              child: Container(
                width: 385,
                height: 169.92,
                decoration: BoxDecoration(
                  color: themeProvider1.isDarkMode
                      ? Color(0xffADD8E6)
                      : Color(0xff93b0b6),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(55),
                    topLeft: Radius.circular(55),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 30,
              child: Text(
                'Weather',
                style: themeProvider1.isDarkMode
                    ? GoogleFonts.roboto(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)
                    : GoogleFonts.roboto(
                        fontSize: 24,
                        color: const Color(0xff3d494b),
                        fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 128.0, left: 60),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 258,
                        height: 470,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xfff3f3f3).withOpacity(0.6),
                              spreadRadius: 20,
                              blurRadius: 1,
                              offset: const Offset(2, 3),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 48.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child:
                                        Image.asset('assets/images/temp.png'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Temperature',
                                    style: textstyle,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  receivedPressure.isNotEmpty
                                      ? Text(
                                          '${receivedPressure}${"\u2103"}',
                                          style: resultstyle,
                                        )
                                      : Text(
                                          '${temperature!.toStringAsFixed(2)}${"\u2103"}',
                                          style: resultstyle,
                                        )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              children: [
                                Image.asset('assets/images/humidity.png'),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text('Humidity', style: textstyle),
                                const SizedBox(
                                  width: 35,
                                ),
                                receivedTemperature.isNotEmpty
                                    ? Text('${receivedTemperature}%',
                                        style: resultstyle)
                                    : Text('${humidity!.toStringAsFixed(2)}%',
                                        style: resultstyle)
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              children: [
                                Image.asset('assets/images/pressure.png'),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text('Pressure', style: textstyle),
                                const SizedBox(
                                  width: 35,
                                ),
                                receivedHumidity.isNotEmpty
                                    ? Text('${receivedHumidity} hpa',
                                        style: resultstyle)
                                    : Text(
                                        '${pressure!.toStringAsFixed(2)} hpa',
                                        style: resultstyle)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 360,
                        left: 20,
                        child: ElevatedButton(
                          onPressed: () {
                            getCurrentLocation();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: themeProvider1.isDarkMode
                                  ? Color(0xffADD8E6)
                                  : const Color(0xFF4a4d7a)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: isGettingLocation
                                ? Text(
                                    'Finding location..',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    'View Location',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 100);

    path.arcTo(
      Rect.fromLTWH(0, size.height - 200, size.width, 200),
      0,
      3.14,
      false,
    );

    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
