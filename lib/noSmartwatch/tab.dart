import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/models/location.dart';
import 'package:track_pro/models/weather.dart';
import 'package:track_pro/noSmartwatch/Home.dart';
import 'package:track_pro/noSmartwatch/scan.dart';
import 'package:track_pro/noSmartwatch/settings.dart';
import 'package:track_pro/noSmartwatch/steps.dart';
import 'package:track_pro/noSmartwatch/temp.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/temp.dart';
import 'package:track_pro/provider/themeprovider.dart';

import 'package:http/http.dart' as http;
import 'package:track_pro/screens/tab.dart';
import 'dart:convert';

import 'package:track_pro/screens/trainingExercises.dart';
import 'package:track_pro/services/weather.dart';

class TabNav1 extends StatefulWidget {
  TabNav1({super.key, this.index = 0});
  int index;

  @override
  State<TabNav1> createState() => _TabNav1State();
}

class _TabNav1State extends State<TabNav1> {
  int selectedPageIndex = 0;
  PlaceLocation? pickedPlace;
  PlaceLocation? currentLocation;
  bool isSwitchedDark = false;

  @override
  void initState() {
    super.initState();

    selectedPageIndex = widget.index;
  }

  void toggleDarkMode(bool value) {
    setState(() {
      isSwitchedDark = value;
    });
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void updateLocation(PlaceLocation location) {
    setState(() {
      currentLocation = location;
    });
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Widget activeScreen = Settings1(
      isSwitchedDark: isSwitchedDark,
      ontoggledarkmode: toggleDarkMode,
    );
    var color = const Color(0x000000ff);
    if (selectedPageIndex == 0) {
      color = const Color(0xFF8183a2);
    }
    if (selectedPageIndex == 1) {
      color = const Color(0xFFf15134);
    }
    if (selectedPageIndex == 2) {
      color = const Color(0xFFffce48);
    }
    if (selectedPageIndex == 4) {
      color = const Color(0xFF93b0b6);
    }
    if (selectedPageIndex == 5) {
      color = const Color(0xFF686d76);
    }
    if (selectedPageIndex == 3) {
      color = themeProvider.isDarkMode ? Colors.white : const Color(0xFF686d76);
    }

    switch (selectedPageIndex) {
      case 0:
        activeScreen = Home();
        break;
      case 1:
        activeScreen = const ConnectingTotrackPro();
        break;
      case 2:
        activeScreen = const StepsCalories();
        break;
      case 4:
        activeScreen = Temperature1(
          place: getCurrentLocation,
        );
        break;
      case 3:
        activeScreen = Trainingexercises();
        break;
      case 5:
        activeScreen = Settings1(
          isSwitchedDark: isSwitchedDark,
          ontoggledarkmode: toggleDarkMode,
        );
        break;
    }

    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        selectedItemColor: color,
        unselectedItemColor: const Color(0xFF666666),
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: selectedPageIndex == 0
                  ? const Color(0xFF8183a2)
                  : const Color(0xFF666666),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.heartPulse,
              color: selectedPageIndex == 1
                  ? const Color(0xFFf15134)
                  : const Color(0xFF666666),
            ),
            label: 'Connect',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.fire,
              color: selectedPageIndex == 2
                  ? const Color(0xFFffce48)
                  : const Color(0xFF666666),
            ),
            label: 'Steps',
          ),
          BottomNavigationBarItem(
            icon: themeProvider.isDarkMode
                ? Icon(
                    FontAwesomeIcons.dumbbell,
                    color: selectedPageIndex == 3
                        ? Colors.white
                        : const Color(0xFF666666),
                  )
                : Icon(
                    FontAwesomeIcons.dumbbell,
                    color: selectedPageIndex == 3
                        ? Colors.grey
                        : const Color(0xFF666666),
                  ),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.temperatureQuarter,
              color: selectedPageIndex == 4
                  ? const Color(0xFF93b0b6)
                  : const Color(0xFF666666),
            ),
            label: 'Temp',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: selectedPageIndex == 5
                  ? const Color(0xFF686d76)
                  : const Color(0xFF666666),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
