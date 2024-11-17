import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_pro/data/setup.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/congratulations.dart';
import 'package:track_pro/screens/tab.dart';
import 'package:track_pro/services/firebase.dart';
import 'package:wheel_chooser/wheel_chooser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class Setupscreens extends StatefulWidget {
  Setupscreens({super.key});

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
  var EnteredUserName;

  void nextPageSmartWatch() {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => TabNav(index: 0)));
  }

  void nextPageWithoutSmartWatch() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => TabNav1(
                  index: 0,
                )));
  }

  @override
  void initState() {
    super.initState();
    _checkSetupCompletion();
  }

  Widget screen = const Text('');

  Future<void> _checkSetupCompletion() async {
    final prefs = await SharedPreferences.getInstance();
    final isSetupComplete = prefs.getBool('isSetupComplete') ?? false;
    final isnotusingsmartwatch = prefs.getBool('isNotUsingSmartwatch') ?? false;

    bool notUsingSmartwatch =
        Provider.of<Isasmartwatchuser>(context, listen: false)
            .isNotUsingSmartwatch;

    if (isSetupComplete) {
      if (isnotusingsmartwatch) {
        nextPageWithoutSmartWatch();
      } else {
        nextPageSmartWatch();
      }
    }
  }

  Future<void> _setSetupComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSetupComplete', true);
    prefs.setBool(
        'isNotUsingSmartwatch',
        Provider.of<Isasmartwatchuser>(context, listen: false)
            .isNotUsingSmartwatch);
  }

  uploadData() async {
    try {
      String userid = Uuid().v4();
      final firestore = FirebaseFirestore.instance;
      // Map<String, dynamic> uploaddata
      final userRef = await firestore.collection('users').add({
        // 'userID': userid,
        'username': Provider.of<UserData>(context, listen: false).userName,
        'age': Provider.of<UserData>(context, listen: false).age,
        'height': Provider.of<UserData>(context, listen: false).height,
        'weight': Provider.of<UserData>(context, listen: false).weight,
        // 'bmi': Provider.of<UserData>(context, listen: false).bmi,
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', userRef.id);

      Provider.of<UserData>(context, listen: false).setUserId(userRef.id);
      print('Data uploaded successfully');
    } catch (e) {
      print('Error uploading data: $e');
    }
  }

  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  void nextSetup() {
    setState(() {
      if (pageindex < 4) pageindex++;
    });
  }

  void savedUserName(String input) {
    EnteredUserName = input;
    Provider.of<UserData>(context, listen: false).setusername(EnteredUserName);
  }

  Future<bool> _onWillPop() async {
    if (pageindex > 1) {
      setState(() {
        pageindex--;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final Indicator = setupItems[pageindex].progressIndicator;
    final title = setupItems[pageindex].title;
    final subtitle = setupItems[pageindex].subtitle;
    final subtitlecolor = setupItems[pageindex].subtitleColor;
    final titlecolor = setupItems[pageindex].titleColor;
    final userHeight = Provider.of<UserData>(context).height / 100;
    final userWeight = Provider.of<UserData>(context).weight;
    final bmi = userWeight / (userHeight * userHeight);
    Provider.of<UserData>(context, listen: false).setbmi(bmi.roundToDouble());

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
                      label: EnteredUserName != null
                          ? Text('${EnteredUserName}')
                          : Text('UserName'),
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
                padding: const EdgeInsets.only(
                  top: 28.0,
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 90),
                  child: WheelChooser.integer(
                    onValueChanged: (value) {
                      setState(() {
                        selectedAgeValue = value;
                        Provider.of<UserData>(context, listen: false)
                            .setAge(value);
                      });
                    },
                    maxValue: 100,
                    minValue: 10,
                    initValue: 25,
                    selectTextStyle:
                        const TextStyle(color: Color(0xFFffce48), fontSize: 17),
                    unSelectTextStyle:
                        const TextStyle(color: Colors.black, fontSize: 17),
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
                          Provider.of<UserData>(context, listen: false)
                              .setHeight(value);
                        });
                      },
                      maxValue: 290,
                      minValue: 100,
                      initValue: 165,
                      selectTextStyle: const TextStyle(
                          color: Color(0xFFffce48), fontSize: 18),
                      unSelectTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),
            const Positioned(
              bottom: 160,
              left: 107,
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
                          Provider.of<UserData>(context, listen: false)
                              .setWeight(value);
                        });
                      },
                      maxValue: 200,
                      minValue: 30,
                      initValue: 60,
                      selectTextStyle: const TextStyle(
                          color: Color(0xFFffce48), fontSize: 17),
                      unSelectTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),
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

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(children: [
        Scaffold(
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
                      const SizedBox(height: 40),
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
                      const SizedBox(height: 20),
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
                      screen,
                      ElevatedButton(
                        onPressed: () async {
                          if (pageindex == setupItems.length - 1) {
                            await uploadData();
                            await _setSetupComplete();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => congratulationscreen(
                                  enteredName: EnteredUserName,
                                ),
                              ),
                            );
                          } else if (pageindex == 1 &&
                              (EnteredUserName?.isEmpty ?? true)) {
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
                            style: TextStyle(color: Colors.white),
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
        ),
      ]),
    );
  }
}
