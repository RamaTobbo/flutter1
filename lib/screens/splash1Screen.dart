import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:track_pro/screens/OnboardingScreens.dart';

class Splash1screen extends StatefulWidget {
  const Splash1screen({super.key});

  @override
  State<Splash1screen> createState() => _Splash1screenState();
}

class _Splash1screenState extends State<Splash1screen> {
  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  Future<void> hideScreen() async {
    Future.delayed(const Duration(seconds: 7), () {
      FlutterNativeSplash.remove();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (ctx) => const Onboardingscreens()));
    });
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
