import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/noSmartwatch/Home.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/screens/HomePage.dart';
import 'package:track_pro/screens/calories.dart';

import 'package:track_pro/screens/tab.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({
    required this.enteredName,
    super.key,
  });
  final String enteredName;

  @override
  Widget build(BuildContext context) {
    String toUpperCase(String name) {
      return name.substring(0, 1).toUpperCase() +
          name.substring(1).toLowerCase();
    }

    void nextPageSmartWatch() {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => TabNav(index: 0)));
    }

    void nextPageWithoutSmartWatch() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => TabNav1(
                    index: 0,
                  )));
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFf9e0e4),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Welcome ${toUpperCase(enteredName)} To TrackPro App!',
                  style: GoogleFonts.robotoFlex(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4a4d7a),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 79,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<Isasmartwatchuser>(context, listen: false)
                          .isNotUsingSmartwatch
                      ? nextPageWithoutSmartWatch()
                      : nextPageSmartWatch();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4a4d7a)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
