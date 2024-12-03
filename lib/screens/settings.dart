import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/screens/HomePage.dart';
import 'package:track_pro/screens/Support.dart';
import 'package:track_pro/screens/privacyPolicy.dart';
import 'package:track_pro/screens/profile.dart';
import 'package:track_pro/screens/rating.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({
    super.key,
    this.isSwitchedDark = false,
    required this.ontoggledarkmode,
  });
  final bool isSwitchedDark;
  final Function(bool) ontoggledarkmode;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  bool isSwitchedDark = false;
  bool showRatingBar = false;
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
  void initState() {
    super.initState();
    isSwitchedDark = widget.isSwitchedDark;

    // _loadSwitchState();
  }

  // _loadSwitchState() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     isSwitchedDark = prefs.getBool('switch_state') ?? false;
  //   });
  // }

  // _saveSwitchState(bool value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('switch_state', value);
  // }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    final ThemeData theme =
        isSwitchedDark ? ThemeData.dark() : ThemeData.light();
    var textStyle = GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: themeProvider.isDarkMode ? Colors.white : Colors.black);

    return PopScope(
      canPop: false,
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor:
              themeProvider.isDarkMode ? Colors.black : Colors.white,
          appBar: AppBar(
            backgroundColor:
                themeProvider.isDarkMode ? Colors.black : Colors.white,
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
                    style: themeProvider.isDarkMode
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
                    activeColor: isDarkMode ? Colors.white : Colors.black,
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        themeProvider.setDarkMode(value);
                        // isSwitchedDark = value;
                        // _saveSwitchState(value);
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                top: 60,
                right: 10,
                child: Text(
                  themeProvider.isDarkMode ? 'Dark Mode' : 'Light Mode',
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildWarningRow() {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        themeProvider1.isDarkMode
            ? Image.asset('assets/images/call.png', width: 60)
            : Image.asset('assets/images/Doorbell.png', width: 60),
        const SizedBox(width: 6),
        Column(
          children: [
            Text('Abnormal pulse heart rate warning',
                style: themeProvider1.isDarkMode
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
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 48.0, top: 60),
      child: Column(
        children: [
          buildSettingsRow(
              context,
              'Profile',
              themeProvider1.isDarkMode
                  ? 'assets/images/profileamber.png'
                  : 'assets/images/profile.png',
              ProfileUser()),
          themeProvider1.isDarkMode ? buildDividerDark() : buildDivider(),
          buildSettingsRow(
              context,
              'Help & Support',
              themeProvider1.isDarkMode
                  ? 'assets/images/questioamber.png'
                  : 'assets/images/howtouse.png',
              Support()),
          themeProvider1.isDarkMode ? buildDividerDark() : buildDivider(),
          buildRateUsRow(),
          themeProvider1.isDarkMode ? buildDividerDark() : buildDivider(),
          buildSettingsRow(
              context,
              'Share to',
              themeProvider1.isDarkMode
                  ? 'assets/images/shareamber.png'
                  : 'assets/images/Share.png',
              null),
          themeProvider1.isDarkMode ? buildDividerDark() : buildDivider(),
          buildSettingsRow(
              context,
              'Privacy policy',
              themeProvider1.isDarkMode
                  ? 'assets/images/privacyamber.png'
                  : 'assets/images/policy.png',
              PrivacyPolicyPage()),
        ],
      ),
    );
  }

  Row buildSettingsRow(BuildContext context, String title, String assetPath,
      Widget? navigateTo) {
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        Image.asset(assetPath),
        const SizedBox(width: 25),
        TextButton(
          onPressed: () {
            if (navigateTo != null) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => navigateTo));
            } else {}
          },
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: themeProvider1.isDarkMode ? Colors.white : Colors.black,
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
    final themeProvider1 = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        Image.asset(themeProvider1.isDarkMode
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
              color: themeProvider1.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
