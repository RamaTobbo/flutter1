import 'package:flutter/material.dart';

class setup {
  const setup(
      {required this.progressIndicator,
      required this.title,
      required this.subtitle,
      required this.titleColor,
      required this.subtitleColor});
  final Widget progressIndicator;
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
}
