import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';

import 'package:track_pro/provider/themeprovider.dart';

import 'package:track_pro/screens/bluetoothpairingScreen1.dart';
import 'package:track_pro/screens/scanning.dart';

class ConnectingTotrackPro extends StatefulWidget {
  const ConnectingTotrackPro({super.key});

  @override
  State<ConnectingTotrackPro> createState() => _ConnectingTotrackProState();
}

class _ConnectingTotrackProState extends State<ConnectingTotrackPro> {
  int pageIndex = 0;
  final titleFont = GoogleFonts.robotoFlex;
  final subtitleFont = GoogleFonts.robotoSlab;

  final pairingChoices = ['Bluetooth', 'ScanQr Code'];
  String selectedPairingMethod = 'ScanQr Code';
  String? _result;
  bool isContinueWithoutSmartWatch = false;

  void setResult(String result) {
    setState(() => _result = result);
  }

  void nextSetup() {
    if (selectedPairingMethod == 'Bluetooth') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const Bluetoothpairingscreen1()),
      );
      Provider.of<Isasmartwatchuser>(context, listen: false).setUserMode(false);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => QrCodeScanner(setResult: setResult)),
      );
      Provider.of<Isasmartwatchuser>(context, listen: false).setUserMode(false);
    }
  }

  DateTime? _lastPressed;
  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (_lastPressed == null ||
        now.difference(_lastPressed!) > Duration(seconds: 2)) {
      _lastPressed = now;
      return false;
    } else {
      return await _showExitDialog() ?? false;
    }
  }

  Future<bool?> _showExitDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit'),
          content: const Text('Do you want to exit trackPro app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                SystemNavigator.pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor:
            themeProvider1.isDarkMode ? Colors.black : Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Do You Want To acess More Features?',
                        style: GoogleFonts.roboto(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Get The Track Pro And track your heart rate\n,blood oxygen and many things more!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          color: themeProvider1.isDarkMode
                              ? Colors.white
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(height: 140),
                    pairingMethodDropdown(),
                    SizedBox(height: 20),
                    continueButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pairingMethodDropdown() {
    return DropdownButton(
      value: selectedPairingMethod,
      items: pairingChoices.map((choice) {
        return DropdownMenuItem(
          value: choice,
          child: Text(
            choice,
            style:
                GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedPairingMethod = value!;
        });
      },
    );
  }

  Widget continueButton() {
    return ElevatedButton(
      onPressed: nextSetup,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
