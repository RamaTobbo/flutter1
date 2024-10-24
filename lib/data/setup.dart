import 'package:flutter/material.dart';
import 'package:track_pro/models/Setup.dart';

const titleColor = Color(0xFF4a4d7a);
const subtitleColor = Color(0xFF7f7f7f);
const border = BorderRadius.all(Radius.circular(30));

final setupItems = [
  const setup(
      progressIndicator: LinearProgressIndicator(
        value: 0.3,
        minHeight: 12,
        borderRadius: border,
        backgroundColor: Color(0xFFD9D9D9),
        valueColor: AlwaysStoppedAnimation(Color(0xFFFFCE48)),
      ),
      title: 'Connect Your SmartWatch',
      subtitle:
          'Connect your samrtwatch via bluetooth or scanning your qr code',
      titleColor: titleColor,
      subtitleColor: subtitleColor),
  const setup(
      progressIndicator: LinearProgressIndicator(
        value: 0.4,
        borderRadius: border,
        backgroundColor: Color(0xFFD9D9D9),
        minHeight: 12,
        valueColor: AlwaysStoppedAnimation(Color(0xFFFFCE48)),
      ),
      title: 'What Is Your Name?',
      subtitle: 'We would love to call you by your name',
      titleColor: titleColor,
      subtitleColor: subtitleColor),
  const setup(
      progressIndicator: LinearProgressIndicator(
        value: 0.5,
        borderRadius: border,
        minHeight: 12,
        backgroundColor: Color(0xFFD9D9D9),
        valueColor: AlwaysStoppedAnimation(Color(0xFFFFCE48)),
      ),
      title: 'What Is Your Age?',
      subtitle: 'Your age is needed for more accurate tracking',
      titleColor: titleColor,
      subtitleColor: subtitleColor),
  const setup(
      progressIndicator: LinearProgressIndicator(
        value: 0.8,
        borderRadius: border,
        minHeight: 12,
        backgroundColor: Color(0xFFD9D9D9),
        valueColor: AlwaysStoppedAnimation(Color(0xFFFFCE48)),
      ),
      title: 'What Is Your Height?',
      subtitle: 'Your Height is needed for steps and calories Calculations',
      titleColor: titleColor,
      subtitleColor: subtitleColor),
  const setup(
      progressIndicator: LinearProgressIndicator(
        borderRadius: border,
        value: 1,
        minHeight: 12,
        backgroundColor: Color(0xFFD9D9D9),
        valueColor: AlwaysStoppedAnimation(Color(0xFFFFCE48)),
      ),
      title: 'What Is Your Weight?',
      subtitle: 'Your Height is needed for steps and calories Calculations',
      titleColor: titleColor,
      subtitleColor: subtitleColor),
];
