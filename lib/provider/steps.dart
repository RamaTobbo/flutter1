import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Steps extends ChangeNotifier {
  double _steps = 0;
  Timer? _timer;
  int _duration = 0;
  double _burnedCalories = 0;
  bool _isCounting = false;
  bool _isPaused = false;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  final double _threshold = 1.9;
  double _previousMagnitude = 0.0;
  double _strideLength = 0;
  DateTime? _lastPausedTime;
  double _stepsBeforePause = 0.0;
  double _magnitudeAtPause = 0.0;

  double get steps => _steps;
  int get duration => _duration;
  double get burnedCalories => _burnedCalories;
  bool get isCounting => _isCounting;
  bool get isPaused => _isPaused;
  double get strideLength => _strideLength;

  void startCounting() {
    if (_isCounting) return;

    _isCounting = true;
    _isPaused = false;

    // Start accelerometer subscription to track steps
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      _handleStepDetection(event);
    });

    _startTimer();
  }

  void pauseCounting() {
    if (!_isCounting || _isPaused) return;

    _isPaused = true;
    _lastPausedTime = DateTime.now();
    _stepsBeforePause = _steps;
    _magnitudeAtPause = sqrt(pow(_previousMagnitude, 2));

    _accelerometerSubscription?.pause();
    _stopTimer();
    notifyListeners();
  }

  void resumeCounting() {
    if (!_isCounting || !_isPaused) return;

    _isPaused = false;
    _accelerometerSubscription?.resume(); // Resume accelerometer
    _startTimer(); // Restart the timer

    Future.delayed(Duration(milliseconds: 500), () {
      _lastPausedTime = null;
      _handleStepDetectionOnResume();
    });

    notifyListeners();
  }

  void stopCounting() {
    if (!_isCounting) return;

    _accelerometerSubscription?.cancel();
    _stopTimer();
    _isCounting = false;
    _isPaused = false;
    notifyListeners();
  }

  void resetSteps() {
    _steps = 0;
    _duration = 0;
    _burnedCalories = 0;
    _strideLength = 0;
    _previousMagnitude = 0.0;
    _lastPausedTime = null;
    notifyListeners();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _duration++;
      notifyListeners();
    });
  }

  // Stop the timer
  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _handleStepDetection(AccelerometerEvent event) {
    double magnitude =
        sqrt(pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2));

    if (_lastPausedTime != null) {
      return;
    }

    if ((magnitude - _previousMagnitude).abs() > _threshold) {
      _steps++;
      _burnedCalories = _steps * 0.04;
      _strideLength = _steps * 0.64;
      notifyListeners();
    }

    _previousMagnitude = magnitude;
  }

  void _handleStepDetectionOnResume() {
    double magnitudeDifference =
        sqrt(pow(_previousMagnitude, 2)) - _magnitudeAtPause;
    if (magnitudeDifference.abs() > _threshold) {
      _steps -= (_steps - _stepsBeforePause);
      _burnedCalories = _steps * 0.04;
      _strideLength = _steps * 0.64;
      notifyListeners();
    }
  }
}
