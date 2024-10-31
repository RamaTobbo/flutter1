import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/data/setup.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/screens/SetupScreens.dart';

import 'package:track_pro/screens/bluetoothpairingScreen1.dart';
import 'package:track_pro/screens/scanning.dart';

class BluetoothSetupscreens extends StatefulWidget {
  const BluetoothSetupscreens({super.key});

  @override
  State<BluetoothSetupscreens> createState() => _BluetoothSetupscreensState();
}

class _BluetoothSetupscreensState extends State<BluetoothSetupscreens> {
  int pageindex = 0;
  final titelFont = GoogleFonts.robotoFlex;
  final subtitleFont = GoogleFonts.robotoSlab;

  final pairingChoices = ['Bluetooth', 'ScanQr Code'];
  var selectedPairingMethod = 'ScanQr Code';
  String? _result;
  bool isContinueWithoutSmartWatch = false;

  void setResult(String result) {
    setState(() => _result = result);
  }

  Widget screen = const Text('');
  void nextSetup() {
    if (selectedPairingMethod == 'Bluetooth') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const Bluetoothpairingscreen1()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => QrCodeScanner(setResult: setResult)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserUsingSmartWatch = Provider.of<Isasmartwatchuser>(context);
    final Indicator = setupItems[0].progressIndicator;
    final title = setupItems[0].title;
    final subtitle = setupItems[0].subtitle;
    final subtitlecolor = setupItems[0].subtitleColor;
    final titlecolor = setupItems[0].titleColor;

    switch (pageindex) {
      case 0:
        screen = Padding(
          padding: const EdgeInsets.symmetric(vertical: 140),
          child: DropdownButton(
              value: selectedPairingMethod,
              items: pairingChoices
                  .map(
                    (choices) => DropdownMenuItem(
                      value: choices,
                      child: Text(
                        choices,
                        style: GoogleFonts.roboto(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPairingMethod = value!;
                });
              }),
        );

        break;

      default:
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 58.0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                    width: 150,
                    padding: const EdgeInsets.only(top: 30, left: 15),
                    child: Indicator),
                const SizedBox(
                  height: 42,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    title,
                    style: titelFont(
                        color: titlecolor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    subtitle,
                    style: subtitleFont(
                        color: subtitlecolor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                //////

                screen,
                ElevatedButton(
                  onPressed: nextSetup,
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
            Positioned(
              right: 50,
              bottom: 10,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amber,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Setupscreens(
                                isContinueWithoutSmartWatch:
                                    isContinueWithoutSmartWatch,
                              )));
                  setState(() {
                    UserUsingSmartWatch.setUserMode(false);
                    isContinueWithoutSmartWatch = true;
                  });
                },
                child: Text('Continue Without trackPro smartwatch'),
              ),
            ),
            Positioned(
              top: 20,
              right: 60,
              child: Text(
                '${pageindex + 1}/5',
                style: GoogleFonts.robotoSlab(
                    color: const Color(0xFFFFCE48), fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
