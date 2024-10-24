import 'package:track_pro/models/Onboarding.dart';
import 'package:flutter/material.dart';

final onboardingItems = [
  const Onboarding(
      background: Color(0xFFffce48),
      title: 'Connect  Your Device To Your Smartwatch And Track Your Body',
      subtitle:
          'You can monitor your body blood pressure,heart rate,steps and  an overview of the weather state',
      image: 'assets/images/onboardimg1.svg',
      dotsColor: Color(0xFF4a4d7a)),
  const Onboarding(
      background: Color(0xFFf9e0e4),
      title: 'View Your Steps And Your Burned Calories',
      subtitle:
          'Set up step counting to monitor your daily activity. The app will record your steps and help you reach your fitness goals,so make sure you are wearing your watch!',
      image: 'assets/images/onboardimg2.svg',
      dotsColor: Color(0xFFffc2cc)),
  const Onboarding(
      background: Color(0xFF96afb3),
      title: 'Monitor Your Heart Rate',
      subtitle:
          'Enable heart rate monitoring to track your heart\'s health in real-time. Place the smartwatch snugly on your wrist for accurate readings',
      image: 'assets/images/onboardimg3.svg',
      dotsColor: Color(0xFF4a4d7a)),
  const Onboarding(
    background: Colors.white,
    title: 'Monitor The Temperature',
    subtitle:
        'Wherever you are you can keep track on the temperature,humidity and pressure',
    image: 'assets/images/onboardimg4.svg',
    dotsColor: Colors.white,
  ),
];
