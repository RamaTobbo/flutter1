import 'package:flutter/material.dart';

class location1 with ChangeNotifier {
  double _longitude = 10;
  double _latitude = 30;
  double get longitude => _longitude;
  double get latitude => _latitude;

  void setLongitude(double long) {
    _longitude = long;
    notifyListeners();
  }

  void setLatitude(double lat) {
    _latitude = lat;
    notifyListeners();
  }
}
