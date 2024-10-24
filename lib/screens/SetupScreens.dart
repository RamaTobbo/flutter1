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
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust font sizes based on screen width
    double titleFontSize = screenWidth * 0.065;
    double subtitleFontSize = screenWidth * 0.045;
    double textFieldFontSize = screenWidth * 0.05;

    final Indicator = setupItems[pageindex].progressIndicator;
    final title = setupItems[pageindex].title;
    final subtitle = setupItems[pageindex].subtitle;
    final subtitlecolor = setupItems[pageindex].subtitleColor;
    final titlecolor = setupItems[pageindex].titleColor;

    // Adjust the layout and content dynamically
    switch (pageindex) {
      case 1:
        screen = Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.2),
                child: SizedBox(
                  width: screenWidth * 0.8, // Make TextField width responsive
                  height: screenHeight * 0.1,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(screenWidth * 0.06),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      fillColor: Colors.white70,
                      label: Text(
                        'UserName',
                        style: TextStyle(fontSize: textFieldFontSize),
                      ),
                    ),
                    maxLength: 10,
                    onChanged: savedUserName,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.2),
            ],
          ),
        );
        break;
      case 2:
        screen = Column(
          children: [
            SizedBox(
              height: screenHeight * 0.4,
              width: screenWidth * 0.4,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: WheelChooser.integer(
                  onValueChanged: (value) {
                    setState(() {
                      selectedAgeValue = value;
                    });
                  },
                  maxValue: 190,
                  minValue: 10,
                  initValue: 25,
                  selectTextStyle: TextStyle(
                      color: const Color(0xFFffce48),
                      fontSize: screenWidth * 0.06),
                  unSelectTextStyle: TextStyle(
                      color: Colors.black, fontSize: screenWidth * 0.06),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
          ],
        );
        break;
      case 3:
        screen = Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.4,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.2),
                    child: WheelChooser.integer(
                      onValueChanged: (value) {
                        setState(() {
                          selectedHeightValue = value;
                        });
                      },
                      maxValue: 290,
                      minValue: 100,
                      initValue: 165,
                      selectTextStyle: TextStyle(
                          color: const Color(0xFFffce48),
                          fontSize: screenWidth * 0.06),
                      unSelectTextStyle: TextStyle(
                          color: Colors.black, fontSize: screenWidth * 0.06),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
              ],
            ),
            Positioned(
              bottom: screenHeight * 0.2,
              left: screenWidth * 0.3,
              child: Text(
                'Cm',
                style:
                    TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04),
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
                  height: screenHeight * 0.35,
                  width: screenWidth * 0.7,
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
                    selectTextStyle: TextStyle(
                        color: const Color(0xFFffce48),
                        fontSize: screenWidth * 0.06),
                    unSelectTextStyle: TextStyle(
                        color: Colors.black, fontSize: screenWidth * 0.06),
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
              ],
            ),
            Positioned(
              bottom: screenHeight * 0.18,
              left: screenWidth * 0.4,
              child: Text(
                'Kg',
                style:
                    TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04),
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
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                      width: screenWidth * 0.4,
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.03, left: screenWidth * 0.04),
                      child: Indicator),
                  SizedBox(height: screenHeight * 0.05),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: Text(
                      title,
                      style: titelFont(
                          color: titlecolor,
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Text(
                      subtitle,
                      style: subtitleFont(
                          color: subtitlecolor,
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: const Text(
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
              top: screenHeight * 0.02,
              right: screenWidth * 0.15,
              child: Text(
                '${pageindex + 1}/5',
                style: GoogleFonts.robotoSlab(
                    color: const Color(0xFFFFCE48),
                    fontSize: screenWidth * 0.05),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
