import 'package:flutter/material.dart';

class Caloriesanddayschart extends StatefulWidget {
  const Caloriesanddayschart({super.key});

  @override
  State<Caloriesanddayschart> createState() => _CaloriesanddayschartState();
}

class _CaloriesanddayschartState extends State<Caloriesanddayschart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calories Burned'),
      ),
    );
  }
}
