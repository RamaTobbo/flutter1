import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:track_pro/screens/bluetoothPairingSuccess.dart';
import 'package:track_pro/screens/bluetoothScanningConnection.dart';

class Bluetoothdeviceconnection extends StatefulWidget {
  const Bluetoothdeviceconnection({super.key});

  ///xxxx
  @override
  State<Bluetoothdeviceconnection> createState() =>
      _BluetoothdeviceconnectionState();
}

class _BluetoothdeviceconnectionState extends State<Bluetoothdeviceconnection> {
  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  Future<void> hideScreen() async {
    Future.delayed(const Duration(seconds: 10), () {
      FlutterNativeSplash.remove();
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const Bluetoothpairingsuccess()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                'Looking for The Track Pro',
                style: GoogleFonts.robotoFlex(
                    color: const Color(0xFF4A4D7A),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SpinKitCircle(
              color: Color(0xFFb7b7b7),
              size: 340.0,
            )
          ],
        ),
      ),
    );
  }
}
