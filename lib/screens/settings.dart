import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_pro/screens/privacyPolicy.dart';

import 'package:track_pro/screens/rating.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  bool isSwitchedDark = false;
  bool showRatingBar = false;
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    void rating() {}

    final ThemeData theme =
        isSwitchedDark ? ThemeData.dark() : ThemeData.light();
    var textStyle = GoogleFonts.poppins(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: const Color(0xff404040),
                  fontWeight: FontWeight.bold)),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/Doorbell.png'),
                          const SizedBox(
                            width: 6,
                          ),
                          Stack(
                            children: [
                              Text(
                                'Abnormal pusle heart rate warning',
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        child: Stack(
                          children: [
                            Text(
                              'Automatically send notifications in cases of high pulse or low pulse heart',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: const Color(0xff808080),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 48.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/profile.png'),
                            const SizedBox(
                              width: 25,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Profile',
                                style: textStyle,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 290,
                          child: const Divider(
                            color: Colors.black,
                            thickness: 0,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/howtouse.png'),
                            const SizedBox(
                              width: 25,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('How to use', style: textStyle),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 290,
                          child: const Divider(
                            color: Colors.black,
                            thickness: 0,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/Star.png'),
                            const SizedBox(
                              width: 25,
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  showRatingBar = !showRatingBar;
                                });
                              },
                              child: Text('Rate us', style: textStyle),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 290,
                          child: const Divider(
                            color: Colors.black,
                            thickness: 0,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/Share.png'),
                            const SizedBox(
                              width: 25,
                            ),
                            TextButton(
                              onPressed: () async {},
                              child: Text('Share to', style: textStyle),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 290,
                          child: const Divider(
                            color: Colors.black,
                            thickness: 0,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/policy.png'),
                            const SizedBox(
                              width: 25,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => PrivacyPolicyPage()));
                              },
                              child: Text('Privacy policy', style: textStyle),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 90,
              right: 10,
              child: Switch(
                  activeColor: Colors.green,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            Positioned(
              top: 0,
              right: 30,
              child: Transform.scale(
                scale: 1.2,
                child: Switch(
                    activeColor: Colors.black,
                    value: isSwitchedDark,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedDark = value;
                      });
                    }),
              ),
            ),
            Positioned(
                top: 40,
                right: 10,
                child: isSwitchedDark == false
                    ? Text('Light Mode', style: textStyle)
                    : Text(
                        'Dark Mode',
                        style: textStyle,
                      )),
          ],
        ),
      ),
    );
  }
}
