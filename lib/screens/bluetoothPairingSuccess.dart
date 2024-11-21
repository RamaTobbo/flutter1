import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/screens/SetupScreens.dart';
import 'package:track_pro/screens/animatedCheckMark.dart';
import 'package:track_pro/screens/tab.dart';

class Bluetoothpairingsuccess extends StatefulWidget {
  const Bluetoothpairingsuccess({super.key});

  @override
  State<Bluetoothpairingsuccess> createState() =>
      _BluetoothpairingsuccessState();
}

class _BluetoothpairingsuccessState extends State<Bluetoothpairingsuccess> {
  @override
  void initState() {
    super.initState();
    _initializeScreen();
  }

  void _initializeScreen() async {
    // Delay to simulate splash screen removal
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();

    // Check setup status
    await _checkSetupCompletion();
  }

  Future<void> _checkSetupCompletion() async {
    final prefs = await SharedPreferences.getInstance();
    final isSetupComplete = prefs.getBool('isSetupComplete') ?? false;
    final isNotUsingSmartwatch = prefs.getBool('isNotUsingSmartwatch') ?? false;

    // Use the provider to determine smartwatch usage
    bool notUsingSmartwatch =
        Provider.of<Isasmartwatchuser>(context, listen: false)
            .isNotUsingSmartwatch;

    if (!mounted) return; // Ensure context is valid

    if (isSetupComplete) {
      // Navigate based on smartwatch usage
      if (!notUsingSmartwatch) {
        nextPageSmartWatch();
      } else {
        nextPageNonSmartWatch();
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => Setupscreens()),
      );
    }
  }

  void nextPageSmartWatch() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (ctx) => TabNav(index: 0)),
    );
  }

  void nextPageNonSmartWatch() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (ctx) => TabNav(index: 0)), // Example index
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pairing Successful',
              style: GoogleFonts.robotoFlex(
                color: const Color(0xFF4A4D7A),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AnimatedCheck(),
          ],
        ),
      ),
    );
  }
}
