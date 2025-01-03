import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/provider/caloriesburned.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/location.dart';
import 'package:track_pro/provider/sensorsData.dart';
import 'package:track_pro/provider/steps.dart';
import 'package:track_pro/provider/weather.dart';
import 'package:track_pro/screens/listofDevices.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/bluetoothDeviceConnection.dart';

import 'package:track_pro/screens/splash1Screen.dart';
import 'package:track_pro/provider/temp.dart';
import 'package:track_pro/screens/trainingExercises.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.settings = Settings(persistenceEnabled: true);
  await dotenv.load(fileName: ".env");
  final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "flutter_background example app",
    notificationText:
        "Background notification for keeping the example app running in the background",
    notificationImportance: AndroidNotificationImportance.normal,
    notificationIcon: AndroidResource(
        name: 'background_icon',
        defType: 'drawable'), // Default is ic_launcher from folder mipmap
  );
  bool success =
      await FlutterBackground.initialize(androidConfig: androidConfig);

  bool notUsingSmartwatch = prefs.getBool('isNotUsingSmartwatch') ?? false;
  // FirebaseMessaging.instance.getToken().then((token) {
  //   print("Firebase Token: $token");
  // });
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //       apiKey: "AIzaSyCnSMpxF1MED57KpXEXi8BvIvEsbv04PyI",
  //       appId: '1:172594653485:android:8a8e83f2dadfba9561cba4',
  //       messagingSenderId: '172594653485',
  //       projectId: 'trackpro-f6d1d'),
  // );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutData()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserData()),
        ChangeNotifierProvider(
          create: (_) => Isasmartwatchuser(),
        ),
        ChangeNotifierProvider(create: (_) => CaloriesBurned()),
        ChangeNotifierProvider(create: (_) => Steps()),
        ChangeNotifierProvider(create: (_) => location1()),
        ChangeNotifierProvider(create: (_) => temp()),
        ChangeNotifierProvider(create: (context) => BluetoothDataProvider()),
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
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
