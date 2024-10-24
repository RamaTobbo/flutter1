import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  final String text;

  const ExampleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.bounceInOut,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: const Color.fromARGB(90, 158, 158, 158),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
      child:
          Text(text, style: textTheme.bodyLarge, textAlign: TextAlign.center),
    );
  }
}
