import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Steps extends ChangeNotifier {
  double _steps = 0;
  int _duration = 0;
  double _burnedCalories = 0;
  bool _isCounting = false;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  final double _threshold = 1.9;
  double _previousMagnitude = 0.0;
  double _stirdeLength = 0;
  double get steps => _steps;
  int get duration => _duration;
  double get burnedCalories => _burnedCalories;
  bool get isCounting => _isCounting;
  double get stirdeLength => _stirdeLength;

  void startCounting() {
    if (_isCounting) return;

    _isCounting = true;
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      double magnitude =
          sqrt(pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2));

      if ((magnitude - _previousMagnitude).abs() > _threshold) {
        _steps++;
        _burnedCalories = _steps * 0.04;
        _stirdeLength = _steps * 0.64;
        notifyListeners();
      }
      _previousMagnitude = magnitude;
    });
  }

  void stopCounting() {
    _accelerometerSubscription?.cancel();
    _isCounting = false;
    notifyListeners();
  }

  void resetSteps() {
    _steps = 0;
    _duration = 0;
    _burnedCalories = 0;
    _previousMagnitude = 0.0;
    _stirdeLength = 0;
    notifyListeners();
  }
}
