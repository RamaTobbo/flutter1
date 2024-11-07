import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/caloriesburned.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/location.dart';
import 'package:track_pro/provider/steps.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/exercises/jumpingJacks.dart';
import 'package:track_pro/screens/splash1Screen.dart';
import 'package:track_pro/provider/temp.dart';
import 'package:track_pro/screens/trainingExercises.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutData()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserData()),
        ChangeNotifierProvider(create: (_) => Isasmartwatchuser()),
        ChangeNotifierProvider(create: (_) => CaloriesBurned()),
        ChangeNotifierProvider(create: (_) => Steps()),
        ChangeNotifierProvider(create: (_) => location1()),
        ChangeNotifierProvider(create: (_) => temp()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: const Splash1screen(),
    );
  }
}
