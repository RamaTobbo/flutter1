// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:sensors_plus/sensors_plus.dart';

// class Steps extends ChangeNotifier {
//   double _steps = 0;
//   Timer? _timer;
//   int _duration = 0;
//   double _burnedCalories = 0;
//   bool _isCounting = false;
//   StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
//   final double _threshold = 1.9;
//   double _previousMagnitude = 0.0;
//   double _stirdeLength = 0;
//   double get steps => _steps;
//   int get duration => _duration;
//   double get burnedCalories => _burnedCalories;
//   bool get isCounting => _isCounting;
//   double get stirdeLength => _stirdeLength;

//   void startCounting() {
//     if (_isCounting) return;

//     _isCounting = true;
//     _accelerometerSubscription =
//         accelerometerEvents.listen((AccelerometerEvent event) {
//       double magnitude =
//           sqrt(pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2));

//       if ((magnitude - _previousMagnitude).abs() > _threshold) {
//         _burnedCalories = _steps * 0.04;
//         _stirdeLength = _steps * 0.64;
//         _steps++;
//         notifyListeners();
//       }
//       _previousMagnitude = magnitude;
//     });
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       _duration++;
//       notifyListeners();
//     });
//   }

//   void _stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }

//   void pauseCounting() {
//     if (!_isCounting) return; // If not counting, do nothing

//     _accelerometerSubscription?.pause(); // Pause the accelerometer subscription
//     _isCounting = false; // Update the state
//     _stopTimer(); // Stop the timer
//     notifyListeners(); // Notify listeners to update UI
//   }

//   // Resume counting process after pause
//   void resumeCounting() {
//     if (_isCounting) return; // If already counting, do nothing

//     _accelerometerSubscription
//         ?.resume(); // Resume the accelerometer subscription
//     _isCounting = true; // Update the state to counting
//     _startTimer(); // Restart the timer
//     notifyListeners(); // Notify listeners to update UI
//   }

//   void stopCounting() {
//     _accelerometerSubscription?.cancel();
//     _isCounting = false;
//     _stopTimer();
//     notifyListeners();
//   }

//   void resetSteps() {
//     _steps = 0;
//     _duration = 0;
//     _burnedCalories = 0;
//     _previousMagnitude = 0.0;
//     _stirdeLength = 0;

//     notifyListeners();
//   }

//   void setSteps(double steps) {
//     _steps = steps;
//     notifyListeners();
//   }
// }
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
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      double magnitude =
          sqrt(pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2));

      if ((magnitude - _previousMagnitude).abs() > _threshold) {
        _steps++;
        _burnedCalories = _steps * 0.04;
        _strideLength = _steps * 0.64;
        notifyListeners();
      }
      _previousMagnitude = magnitude;
    });
    _startTimer();
  }

  void pauseCounting() {
    if (!_isCounting || _isPaused) return;

    _isPaused = true;
    _accelerometerSubscription?.pause();
    _stopTimer();
    notifyListeners();
  }

  void resumeCounting() {
    if (!_isCounting || !_isPaused) return;

    _isPaused = false;
    _accelerometerSubscription?.resume();
    _startTimer();
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

    notifyListeners();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _duration++;
      notifyListeners();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
