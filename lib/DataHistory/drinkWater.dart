import 'package:flutter/material.dart';

class Drinkwater extends StatefulWidget {
  const Drinkwater({super.key});

  @override
  State<Drinkwater> createState() => _DrinkwaterState();
}

class _DrinkwaterState extends State<Drinkwater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drink Water!'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
