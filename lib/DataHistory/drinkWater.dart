import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drinkwater extends StatefulWidget {
  const Drinkwater({super.key});

  @override
  State<Drinkwater> createState() => _DrinkwaterState();
}

class _DrinkwaterState extends State<Drinkwater> {
  double _currentIntake = 0;
  double _dailyGoal = 2000;
  final TextEditingController _goalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCurrentIntake();
    _loadDailyGoal();
  }

  _loadCurrentIntake() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentIntake = prefs.getDouble('currentIntake') ?? 0;
    });
  }

  _loadDailyGoal() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _dailyGoal = prefs.getDouble('dailyGoal') ?? 2000;
      _goalController.text = (_dailyGoal / 1000).toString();
    });
  }

  _saveCurrentIntake() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('currentIntake', _currentIntake);
  }

  _saveDailyGoal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('dailyGoal', _dailyGoal);
  }

  void _addWater(double amount) {
    setState(() {
      _currentIntake += amount;
      if (_currentIntake > _dailyGoal) {
        _currentIntake = _dailyGoal;
      }
      _saveCurrentIntake();
    });
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (_currentIntake / _dailyGoal) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drink Water!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _goalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Set Your Goal (in Liters)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                double newGoal = double.tryParse(value) ?? 0;
                setState(() {
                  if (newGoal > 0) {
                    _dailyGoal = newGoal * 1000;
                    _saveDailyGoal();
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Your Goal: ${_dailyGoal / 1000} Liters',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Current Intake: ${_currentIntake / 1000} Liters',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 20,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xff96afb3)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addWater(250);
              },
              child: const Text('Drink 250ml'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentIntake = 0;
                  _saveCurrentIntake();
                });
              },
              child: const Text('Reset Intake'),
            ),
          ],
        ),
      ),
    );
  }
}
