import 'package:flutter/material.dart';

class Onboarding {
  const Onboarding(
      {required this.background,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.dotsColor});

  final Color background;
  final String title;
  final String subtitle;
  final String image;
  final Color dotsColor;
}
