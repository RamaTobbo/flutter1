import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:track_pro/models/location.dart';
import 'package:track_pro/screens/map.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key, required this.place});
  final Function place;

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  PlaceLocation? pickedPlace;
  @override
  var isGettingLocation = false;
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
    final longitude = locationData.longitude;
    final latitude = locationData.latitude;
    if (longitude == null || latitude == null) {
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
  }

  final textstyle =
      GoogleFonts.roboto(fontSize: 20, color: const Color(0xff575757));
  final resultstyle =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: RoundedBottomClipper(),
              child: Container(
                width: 375,
                height: 169.92,
                decoration: const BoxDecoration(
                  color: Color(0xff93b0b6),
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
                style: GoogleFonts.roboto(
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
                        width: 238,
                        height: 430,
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
                                  Text(
                                    'result${"\u2103"}',
                                    style: resultstyle,
                                  ),
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
                                Text('result', style: resultstyle),
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
                                Text('result', style: resultstyle),
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
                            if (pickedPlace != null) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => MapScreen(
                                        location: pickedPlace!,
                                        isSelecting: false,
                                      )));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Could not get location. Please try again.'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4a4d7a)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
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
