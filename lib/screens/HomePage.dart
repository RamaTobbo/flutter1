import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/heartRate.dart';
import 'package:track_pro/widgets/chatbot.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUserId = prefs.getString('userId');

    if (storedUserId != null) {
      // Set the userId in the UserData provider
      Provider.of<UserData>(context, listen: false).setUserId(storedUserId);
      print("UserId loaded from SharedPreferences: $storedUserId");
    } else {
      print("No userId found in SharedPreferences");
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    final bmi = Provider.of<UserData>(context, listen: false).bmi;

    String bmiCategory;
    if (bmi < 18.5) {
      bmiCategory = 'UnderWeight';
    } else if (bmi > 18.5 && bmi <= 24.9) {
      bmiCategory = 'Normal';
    } else if (bmi > 15 && bmi <= 29.9) {
      bmiCategory = 'OverWeight';
    } else {
      bmiCategory = 'Obese';
    }
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 158.0, top: 20),
                      child: Text(
                        'Home',
                        style: GoogleFonts.roboto(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 34),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const Heartrate()));
                        },
                        child: Container(
                          width: 315,
                          height: 146,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFf9e0e4),
                            boxShadow: [
                              themeProvider1.isDarkMode
                                  ? BoxShadow(
                                      color: Colors.grey.withOpacity(0.01),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  : BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    )
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Heart.png',
                                  ),
                                  Text('Heart Rate',
                                      style: GoogleFonts.roboto(
                                          color: const Color(0xFF62585a),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 98.0),
                                child: Row(
                                  children: [
                                    Text('Result',
                                        style: GoogleFonts.roboto(
                                            fontSize: 29,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('bpm',
                                          style: GoogleFonts.roboto(
                                              color: const Color(0xFF675c5e))),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          InkWell(
                            child: Container(
                              width: 161,
                              height: 147,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xFF8183a2),
                                boxShadow: [
                                  themeProvider1.isDarkMode
                                      ? BoxShadow(
                                          color: Colors.grey.withOpacity(0.01),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 0),
                                        )
                                      : BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/Step.png',
                                        width: 65,
                                        height: 45,
                                      ),
                                      Text('Steps',
                                          style: GoogleFonts.roboto(
                                              color: const Color(0xFF2c2d37),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 20),
                                    child: Row(
                                      children: [
                                        Text('Result',
                                            style: GoogleFonts.roboto(
                                                fontSize: 29,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text('step',
                                              style: GoogleFonts.roboto(
                                                  color:
                                                      const Color(0xFF675c5e))),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          InkWell(
                            child: Container(
                              width: 161,
                              height: 147,
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xFFffdd7f),
                                boxShadow: [
                                  themeProvider1.isDarkMode
                                      ? BoxShadow(
                                          color: Colors.grey.withOpacity(0.01),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 0),
                                        )
                                      : BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/BMI.png',
                                        width: 65,
                                        height: 45,
                                      ),
                                      Text(
                                        'Your BMI',
                                        style: GoogleFonts.roboto(
                                            color: const Color(0xFF574b2b),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                            '${Provider.of<UserData>(context, listen: false).bmi}',
                                            style: GoogleFonts.roboto(
                                                fontSize: 29,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'kg/m²',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Text('${bmiCategory}',
                                        style: GoogleFonts.roboto(
                                            color: const Color(0xFF675c5e))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 34),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 335,
                          height: 146,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFb6c7ca),
                            boxShadow: [
                              themeProvider1.isDarkMode
                                  ? BoxShadow(
                                      color: Colors.grey.withOpacity(0.01),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  : BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/weather.png',
                                      width: 107, height: 100),
                                  Text('Weather',
                                      style: GoogleFonts.roboto(
                                          color: const Color(0xFF3e4445),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 98.0),
                                child: Row(
                                  children: [
                                    Text('Result',
                                        style: GoogleFonts.roboto(
                                            fontSize: 29,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('',
                                          style: GoogleFonts.roboto(
                                              color: const Color(0xFF675c5e))),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const Chatbot()));
              },
              child: Image.asset(
                'assets/images/chat.png',
                width: 70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
