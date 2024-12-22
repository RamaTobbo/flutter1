import 'package:flutter/material.dart';

class BluetoothDataProvider extends ChangeNotifier {
  String _pressure = "";
  String _humidity = "";
  String _temperature = "";

  String get pressure => _pressure;
  String get humidity => _humidity;
  String get temperature => _temperature;

  void updateData(String temperature, String humidity, String pressure) {
    _temperature = temperature;
    _humidity = humidity;
    _pressure = pressure;

    // Notify listeners (the UI) that the data has changed
    notifyListeners();
  }

  void setPressure(String pressure) {
    _pressure = pressure;
    notifyListeners();
  }

  void setHumidity(String humidity) {
    _humidity = humidity;
    notifyListeners();
  }

  void setTemperature(String temperature) {
    _temperature = temperature;
    notifyListeners();
  }

  void resetData() {
    _pressure = "0.0";
    _humidity = "0.0";
    _temperature = " 0.0";
    notifyListeners();
  }
}
