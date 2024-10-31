import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/screens/heartRate.dart';
import 'package:track_pro/widgets/chatbot.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
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
                        child: Container(
                          width: 315,
                          height: 146,
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
                                    )
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Step.png',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Text('Steps',
                                        style: GoogleFonts.roboto(
                                            color: const Color(0xFF2c2d37),
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 98.0),
                                child: Row(
                                  children: [
                                    Text('Result',
                                        style: GoogleFonts.roboto(
                                            fontSize: 29,
                                            fontWeight: FontWeight.bold)),
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
                          const SizedBox(
                            width: 7,
                          ),
                          InkWell(
                            child: Container(
                              width: 315,
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
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 90.0, top: 20),
                                    child: Row(
                                      children: [
                                        Text('Result',
                                            style: GoogleFonts.roboto(
                                                fontSize: 29,
                                                fontWeight: FontWeight.bold)),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 34),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 315,
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
                                padding: const EdgeInsets.only(left: 120.0),
                                child: Row(
                                  children: [
                                    Text('Result',
                                        style: GoogleFonts.roboto(
                                            fontSize: 29,
                                            fontWeight: FontWeight.bold)),
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
