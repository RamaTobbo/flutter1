import 'package:flutter/material.dart';

class Lunge extends StatefulWidget {
  const Lunge({super.key});

  @override
  State<Lunge> createState() => _LungeState();
}

class _LungeState extends State<Lunge> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Image.asset(''),
        ToggleButtons(children: children, isSelected: isSelected),
        Row(
          children: [
            Text('Duration'),
            //
          ],
        ),
      ],
    ));
  }
}
