import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_pro/data/setup.dart';

import 'package:track_pro/screens/congratulations.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class Setupscreens extends StatefulWidget {
  const Setupscreens({super.key});

  @override
  State<Setupscreens> createState() => _SetupscreensState();
}

class _SetupscreensState extends State<Setupscreens> {
  int pageindex = 1;
  int selectedAgeValue = 20;
  int selectedHeightValue = 165;
  int selectedWeightValue = 60;
  final titelFont = GoogleFonts.robotoFlex;
  final subtitleFont = GoogleFonts.robotoSlab;
  final userNameController = TextEditingController();
  var EnteredUserName = '';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController;
  }

  final pairingChoices = ['Bluetooth', 'Scan Qr code'];
  var selectedPairingMethod = 'Bluetooth';

  Widget screen = const Text('');
  void nextSetup() {
    setState(() {
      if (pageindex < 4) pageindex++;
    });
  }

  void savedUserName(String input) {
    EnteredUserName = input;
  }

  @override
  Widget build(BuildContext context) {
    final Indicator = setupItems[pageindex].progressIndicator;
    final title = setupItems[pageindex].title;
    final subtitle = setupItems[pageindex].subtitle;
    final subtitlecolor = setupItems[pageindex].subtitleColor;
    final titlecolor = setupItems[pageindex].titleColor;

    switch (pageindex) {
      case 1:
        screen = Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: SizedBox(
                  width: 297,
                  height: 80,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      fillColor: Colors.white70,
                      label: const Text('UserName'),
                    ),
                    maxLength: 10,
                    onChanged: savedUserName,
                  ),
                ),
              ),
              const SizedBox(
                height: 180,
              )
            ],
          ),
        );

        break;
      case 2:
        screen = Column(
          children: [
            SizedBox(
              height: 273,
              width: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 90),
                  child: WheelChooser.integer(
                    onValueChanged: (value) {
                      setState(() {
                        selectedAgeValue = value;
                      });
                    },
                    maxValue: 190,
                    minValue: 10,
                    initValue: 25,
                    selectTextStyle:
                        const TextStyle(color: Color(0xFFffce48), fontSize: 28),
                    unSelectTextStyle:
                        const TextStyle(color: Colors.black, fontSize: 28),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 120),
          ],
        );
        break;
      case 3:
        screen = Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 270,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 125.0),
                    child: WheelChooser.integer(
                      onValueChanged: (value) {
                        setState(() {
                          selectedHeightValue = value;
                        });
                      },
                      maxValue: 290,
                      minValue: 100,
                      initValue: 165,
                      selectTextStyle: const TextStyle(
                          color: Color(0xFFffce48), fontSize: 28),
                      unSelectTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 28),
                    ),
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),
            const Positioned(
              bottom: 160,
              left: 120,
              child: Text(
                'Cm',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        );
        break;
      case 4:
        screen = Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 260,
                  width: 260,
                  child: Container(
                    padding: const EdgeInsets.only(top: 140),
                    child: WheelChooser.integer(
                      horizontal: true,
                      onValueChanged: (value) {
                        setState(() {
                          selectedWeightValue = value;
                        });
                      },
                      maxValue: 200,
                      minValue: 30,
                      initValue: 60,
                      selectTextStyle: const TextStyle(
                          color: Color(0xFFffce48), fontSize: 28),
                      unSelectTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 28),
                    ),
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),
            // SizedBox(height: 70),
            const Positioned(
              bottom: 145,
              left: 150,
              child: Text(
                'Kg',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        );
        break;
      default:
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45.0),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                      width: 150,
                      padding: const EdgeInsets.only(top: 30, left: 15),
                      child: Indicator),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      title,
                      style: titelFont(
                          color: titlecolor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      subtitle,
                      style: subtitleFont(
                          color: subtitlecolor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //////

                  screen,
                  ElevatedButton(
                    onPressed: () {
                      if (pageindex == setupItems.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => congratulationscreen(
                              enteredName: EnteredUserName,
                            ),
                          ),
                        );
                      } else if (pageindex == 1 && EnteredUserName.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'UserName is missing, please enter a UserName'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        nextSetup();
                      }
                    },
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
