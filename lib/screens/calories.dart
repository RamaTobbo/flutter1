import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/themeprovider.dart';

class Calories extends StatefulWidget {
  const Calories({super.key});

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  @override
  Widget build(BuildContext context) {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: 375,
                  height: 248,
                  decoration: BoxDecoration(
                      color: themeProvider1.isDarkMode
                          ? Color(0xffffce48)
                          : Color(0xffffce48),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(56),
                          bottomRight: Radius.circular(44))),
                ),
              ],
            ),
            Positioned(
              left: 20,
              top: 40,
              child: Text('Calories And Steps',
                  style: GoogleFonts.roboto(
                      color: themeProvider1.isDarkMode
                          ? Colors.white
                          : Color(0xff574619),
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
            Positioned(
              left: 67,
              top: 170,
              child: Container(
                width: 232,
                height: 420,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xfff3f3f3).withOpacity(0.6),
                      spreadRadius: 20,
                      blurRadius: 1,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 50),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Steps',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: const Color(0xFF575757),
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Text(
                              'Result',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              'step',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          children: [
                            Text(
                              'Calories ',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: const Color(0xFF575757),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Result',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/distance.png'),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      const Text('result',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/fire.png'),
                                    const Text('result',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/time.png'),
                                      const Text(
                                        'result',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 22.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: themeProvider1.isDarkMode
                                    ? Color(0xffffce48)
                                    : const Color(0xFF4a4d7a)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                'Set Goal',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
