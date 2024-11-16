import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/data/Onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:track_pro/screens/bluetoothSetup.dart';

class Onboardingscreens extends StatefulWidget {
  const Onboardingscreens({super.key});

  @override
  State<Onboardingscreens> createState() => _OnboardingscreensState();
}

class _OnboardingscreensState extends State<Onboardingscreens> {
  final textFont = GoogleFonts.robotoSlab;
  final PageController _pageController = PageController();
  int pageindex = 0;

  @override
  void initState() {
    super.initState();
    _checkIfOnboardingCompleted();
    _pageController.addListener(() {
      setState(() {
        pageindex = _pageController.page?.round() ?? 0;
      });
    });
  }

  Future<void> _checkIfOnboardingCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isOnboardingCompleted =
        prefs.getBool('isOnboardingCompleted') ?? false;

    if (isOnboardingCompleted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => const BluetoothSetupscreens()),
      );
    }
  }

  Future<void> _markOnboardingAsCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isOnboardingCompleted', true);
  }

  void nextOnboarding() {
    if (pageindex < onboardingItems.length - 1) {
      _pageController.jumpToPage(pageindex + 1);
    } else {
      _markOnboardingAsCompleted();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => const BluetoothSetupscreens()),
      );
    }
  }

  void skipOnboarding() {
    _markOnboardingAsCompleted();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (ctx) => const BluetoothSetupscreens()));
  }

  @override
  Widget build(BuildContext context) {
    final image = onboardingItems[pageindex].image;
    final title = onboardingItems[pageindex].title;
    final subtitle = onboardingItems[pageindex].subtitle;
    final dotsColor = onboardingItems[pageindex].dotsColor;
    final backgroundColor = onboardingItems[pageindex].background;
    final Color titleColor;
    final Color subtitleColor;
    final Color buttonColor;

    if (pageindex % 2 == 0) {
      titleColor = Colors.white;
      subtitleColor = const Color(0xFFfffefd);
      buttonColor = const Color(0xFF4a4d7a);
    } else {
      titleColor = const Color(0xFF5c5c85);
      subtitleColor = const Color(0xFF5c5c85);
      buttonColor = const Color(0xFFf15134);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            // onPageChanged: ,
            itemCount: onboardingItems.length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      image,
                      width: 260,
                      height: 280,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      title,
                      style: textFont(
                        color: titleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        subtitle,
                        style: textFont(
                          color: subtitleColor,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: pageindex == onboardingItems.length - 1 ? 55 : 60,
                    ),
                    ElevatedButton(
                      onPressed: nextOnboarding,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          padding: const EdgeInsets.symmetric(horizontal: 20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26.0),
                        child: Text(
                          pageindex == onboardingItems.length - 1
                              ? 'Finish'
                              : 'Continue',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: onboardingItems.length,
                      position: pageindex,
                      decorator: DotsDecorator(
                        color: Colors.white,
                        activeColor: dotsColor,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          Positioned(
            right: 10,
            top: 20,
            child: TextButton(
              onPressed: skipOnboarding,
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
