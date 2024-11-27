import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/userdata.dart';

import 'package:track_pro/screens/OnboardingScreens.dart';
import 'package:track_pro/screens/tab.dart';

class Splash1screen extends StatefulWidget {
  const Splash1screen({super.key});

  @override
  State<Splash1screen> createState() => _Splash1screenState();
}

class _Splash1screenState extends State<Splash1screen> {
  bool userNotUsingSmartWatch = true;
  void fetchUserUsingSmartWatch(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUserId = prefs.getString('userId');
      Provider.of<UserData>(context, listen: false).setUserId(storedUserId!);
      print('idddd${storedUserId}');
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(storedUserId)
          .get();

      if (snapshot.exists) {
        debugPrint("Fetched user dataaaaa: ${snapshot.data()}");

        userNotUsingSmartWatch = snapshot['IsNotAsmartwatchUser'] ?? true;

        if (snapshot.data() != null) {
          if (mounted) {
            setState(() {
              userNotUsingSmartWatch = snapshot['IsNotAsmartwatchUser'] ?? true;

              if (userNotUsingSmartWatch == false) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TabNav()),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TabNav1()),
                );
              }
            });
          }
        } else {
          debugPrint("Field 'IsNotAsmartwatchUser' is missing.");
        }
      } else {
        debugPrint("No user found for the given ID.");
      }
    } catch (e) {
      debugPrint("Error fetching user information: $e");
    }
  }

  @override
  void initState() {
    super.initState();

    fetchUserUsingSmartWatch(context);
    print('user mode: ${userNotUsingSmartWatch}');

    hideScreen();
  }

  Future<void> hideScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool setupCompleted = prefs.getBool('isSetupCompleted') ?? false;
    final isnotusingsmartwatch = prefs.getBool('isNotUsingSmartwatch') ?? false;

    await Future.delayed(const Duration(seconds: 3));

    // bool isNotUsingSmartwatch =
    //     Provider.of<Isasmartwatchuser>(context, listen: false)
    //         .isNotUsingSmartwatch;

    FlutterNativeSplash.remove();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) {
          if (!setupCompleted) {
            return const Onboardingscreens();
          } else {
            return isnotusingsmartwatch ? TabNav1(index: 0) : TabNav(index: 0);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 190),
              child: Text(
                'TRACK PRO',
                style: GoogleFonts.robotoCondensed(fontSize: 32),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130),
              child: LoadingAnimationWidget.fourRotatingDots(
                color: const Color(0xFFffce48),
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
