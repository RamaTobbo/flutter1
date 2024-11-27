import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/userdata.dart';
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
  void updateUserUsingSmartWatch() async {
    try {
      String userId = Provider.of<UserData>(context, listen: false).userId;

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'IsNotAsmartwatchUser':
            Provider.of<Isasmartwatchuser>(context, listen: false)
                .isNotUsingSmartwatch,
      });
    } catch (e) {
      debugPrint("Error updating user information: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error updating profile")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeScreen();

    Provider.of<Isasmartwatchuser>(context, listen: false).setUserMode(false);
    updateUserUsingSmartWatch();
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

    bool notUsingSmartwatch =
        Provider.of<Isasmartwatchuser>(context, listen: false)
            .isNotUsingSmartwatch;

    if (!mounted) return;

    if (isSetupComplete) {
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
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx) => TabNav(index: 0)),
        (Route) => false);
  }

  void nextPageNonSmartWatch() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx) => TabNav(index: 0)),
        (Route) => false);
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
