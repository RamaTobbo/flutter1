import 'package:flutter/material.dart';
import 'package:track_pro/screens/calories.dart';

import 'package:track_pro/screens/splash1Screen.dart';
import 'package:track_pro/screens/tab.dart';
import 'package:track_pro/screens/temperature.dart';
import 'package:track_pro/widgets/chatbot.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash1screen(),
    ),
  );
}
