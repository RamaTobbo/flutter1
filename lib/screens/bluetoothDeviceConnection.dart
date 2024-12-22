import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_pro/screens/listofDevices.dart';

class Bluetoothdeviceconnection extends StatefulWidget {
  const Bluetoothdeviceconnection({super.key});

  @override
  State<Bluetoothdeviceconnection> createState() =>
      _BluetoothdeviceconnectionState();
}

class _BluetoothdeviceconnectionState extends State<Bluetoothdeviceconnection> {
  @override
  void initState() {
    super.initState();

    // Delay for 10 seconds, then navigate to another screen
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SelectBluetoothDevice()),
      );
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
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
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
