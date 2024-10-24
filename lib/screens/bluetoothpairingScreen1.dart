import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:track_pro/screens/bluetoothDeviceConnection.dart';

class Bluetoothpairingscreen1 extends StatefulWidget {
  const Bluetoothpairingscreen1({super.key});

  @override
  State<Bluetoothpairingscreen1> createState() =>
      _Bluetoothpairingscreen1State();
}

class _Bluetoothpairingscreen1State extends State<Bluetoothpairingscreen1> {
  void startPairing() {
    Navigator.push(context,
        MaterialPageRoute(builder: (ctx) => const Bluetoothdeviceconnection()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Track Pro Pairing',
            style: GoogleFonts.robotoFlex(
                color: const Color(0xFF4A4D7A),
                fontSize: 25,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Make sure your device and your smartwatch are close',
            style: GoogleFonts.robotoSlab(
                fontSize: 20, color: const Color(0xFF838383)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 29),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/phone.svg',
                  width: 74,
                  height: 172,
                ),
                const SizedBox(
                  width: 15,
                ),
                JumpingDots(
                  color: const Color(0xFF93b0b6),
                  radius: 7,
                  numberOfDots: 3,
                  animationDuration: const Duration(milliseconds: 200),
                ),
                SvgPicture.asset(
                  'assets/images/watch.svg',
                  width: 190,
                  height: 145,
                ),
              ],
            ),
          ),
          const SizedBox(height: 160),
          ElevatedButton(
            onPressed: startPairing,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4a4d7a)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Start Pairing',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
