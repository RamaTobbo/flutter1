import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_pro/screens/privacyPolicy.dart';
import 'package:track_pro/screens/profile.dart';
import 'package:track_pro/screens/rating.dart';

class Settings extends StatefulWidget {
  const Settings({super.key, this.isSwitchedDark = false});
  final bool isSwitchedDark;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  bool isSwitchedDark = false;
  bool showRatingBar = false;

  @override
  void initState() {
    super.initState();
    isSwitchedDark = widget.isSwitchedDark;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =
        isSwitchedDark ? ThemeData.dark() : ThemeData.light();
    var textStyle = GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isSwitchedDark ? Colors.white : Colors.black);

    return Scaffold(
      backgroundColor: isSwitchedDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isSwitchedDark ? Colors.black : Colors.white,
        title: Text('Settings', style: textStyle),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  buildWarningRow(),
                  const SizedBox(height: 30),
                  buildSettingsList(context, textStyle),
                ],
              ),
            ),
          ),
          Positioned(
            top: 160,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Text(
                'Automatically send notifications \nin cases of high pulse or low \npulse heart',
                style: isSwitchedDark
                    ? GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white,
                      )
                    : GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Positioned(
            top: 150,
            right: 10,
            child: Switch(
              activeColor: Colors.green,
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
          Positioned(
            top: 10,
            right: 30,
            child: Transform.scale(
              scale: 1.2,
              child: Switch(
                activeColor: isSwitchedDark ? Colors.amber : Colors.black,
                value: isSwitchedDark,
                onChanged: (value) {
                  setState(() {
                    isSwitchedDark = value;
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 10,
            child: Text(
              isSwitchedDark ? 'Dark Mode' : 'Light Mode',
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }

  Row buildWarningRow() {
    return Row(
      children: [
        isSwitchedDark
            ? Image.asset('assets/images/call.png', width: 60)
            : Image.asset('assets/images/Doorbell.png', width: 60),
        const SizedBox(width: 6),
        Column(
          children: [
            Text('Abnormal pulse heart rate warning',
                style: isSwitchedDark
                    ? GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)
                    : GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
          ],
        )
      ],
    );
  }

  Padding buildSettingsList(BuildContext context, TextStyle textStyle) {
    return Padding(
      padding: const EdgeInsets.only(left: 48.0, top: 60),
      child: Column(
        children: [
          buildSettingsRow(
              context,
              'Profile',
              isSwitchedDark
                  ? 'assets/images/profileamber.png'
                  : 'assets/images/profile.png',
              ProfileUser()),
          isSwitchedDark ? buildDividerDark() : buildDivider(),
          buildSettingsRow(
              context,
              'How to use',
              isSwitchedDark
                  ? 'assets/images/questioamber.png'
                  : 'assets/images/howtouse.png',
              PrivacyPolicyPage()),
          isSwitchedDark ? buildDividerDark() : buildDivider(),
          buildRateUsRow(),
          isSwitchedDark ? buildDividerDark() : buildDivider(),
          buildSettingsRow(
              context,
              'Share to',
              isSwitchedDark
                  ? 'assets/images/shareamber.png'
                  : 'assets/images/Share.png',
              null),
          isSwitchedDark ? buildDividerDark() : buildDivider(),
          buildSettingsRow(
              context,
              'Privacy policy',
              isSwitchedDark
                  ? 'assets/images/privacyamber.png'
                  : 'assets/images/policy.png',
              PrivacyPolicyPage()),
        ],
      ),
    );
  }

  Row buildSettingsRow(BuildContext context, String title, String assetPath,
      Widget? navigateTo) {
    return Row(
      children: [
        Image.asset(assetPath),
        const SizedBox(width: 25),
        TextButton(
          onPressed: () {
            if (navigateTo != null) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => navigateTo));
            } else {
              // Implement the share functionality here if needed
            }
          },
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isSwitchedDark ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  buildDividerDark() {
    return const SizedBox(
      width: 290,
      child: Divider(
        color: Colors.amber,
        thickness: 0,
      ),
    );
  }

  buildDivider() {
    return const SizedBox(
      width: 290,
      child: Divider(
        color: Colors.black,
        thickness: 0,
      ),
    );
  }

  Row buildRateUsRow() {
    return Row(
      children: [
        Image.asset(isSwitchedDark
            ? 'assets/images/staramber.png'
            : 'assets/images/Star.png'),
        const SizedBox(width: 25),
        TextButton(
          onPressed: () {
            setState(() {
              showRatingBar = !showRatingBar;
            });
          },
          child: Text(
            'Rate us',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isSwitchedDark ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
