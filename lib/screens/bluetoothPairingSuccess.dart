import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/screens/SetupScreens.dart';
import 'package:track_pro/screens/animatedCheckMark.dart';

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
    Future.delayed(const Duration(seconds: 1), () {
      Future.delayed(const Duration(seconds: 1), () {
        FlutterNativeSplash.remove();

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => Setupscreens()));
      });
    });
  }

  @override
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
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedCheck(),
          ],
        ),
      ),
    );
  }
}
