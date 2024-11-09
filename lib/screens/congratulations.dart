import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_pro/screens/welcomeScreen.dart';

class congratulationscreen extends StatelessWidget {
  const congratulationscreen({
    super.key,
    required this.enteredName,
  });
  final String enteredName;

  @override
  Widget build(BuildContext context) {
    void nextScreen() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (ctx) => Welcomescreen(
                    enteredName: enteredName,
                  )));
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFffce48),
        body: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/congratsAnimation3.gif'),
                  Text(
                    'Congratulations!',
                    style: GoogleFonts.robotoFlex(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'You have completed all the steps',
                    style: GoogleFonts.robotoSlab(
                        color: const Color(0xFF7f6724),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 180,
                  ),
                  ElevatedButton(
                    onPressed: nextScreen,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFf15134)),
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
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset('assets/images/congratsAnimation1.gif'),
          ),
          Positioned(
            left: 40,
            top: 0,
            child: Image.asset('assets/images/congratsAnimation1.gif'),
          ),
          Positioned(
            left: 80,
            top: 0,
            child: Image.asset('assets/images/congratsAnimation1.gif'),
          ),
          Positioned(
            left: 100,
            top: 0,
            child: Image.asset('assets/images/congratsAnimation1.gif'),
          ),
          Positioned(
            left: 180,
            top: 0,
            child: Image.asset('assets/images/congratsAnimation1.gif'),
          ),
          Positioned(
            left: 200,
            top: 0,
            child: Image.asset('assets/images/congratsAnimation1.gif'),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: Image.asset('assets/images/congratsAnimation1.gif')),
          Positioned(
              left: 0,
              top: 90,
              child: Image.asset('assets/images/congratsAnimation1.gif')),
          Positioned(
              right: 0,
              top: 90,
              child: Image.asset('assets/images/congratsAnimation1.gif')),
        ]),
      ),
    );
  }
}
