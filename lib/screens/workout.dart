import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/data/workout.dart';

import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/themeprovider.dart';

class Workout1 extends StatefulWidget {
  const Workout1({super.key});

  @override
  State<Workout1> createState() => _Workout1State();
}

class _Workout1State extends State<Workout1> {
  int _selectedMinutes = 1;
  Timer? _timer;
  int _remainingTime = 0;

  void startTimer(int minutes) {
    setState(() {
      _remainingTime = minutes * 60;
    });

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void showTimerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Timer Duration'),
          content: DropdownButton<int>(
            value: _selectedMinutes,
            items: List.generate(60, (index) {
              return DropdownMenuItem(
                value: index + 1,
                child: Text('${index + 1} minute${index == 0 ? '' : 's'}'),
              );
            }),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedMinutes = value;
                });
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                startTimer(_selectedMinutes);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => TabNav1(
                          index: 3,
                        )));
              },
              child: Text('Start Exercise'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final workoutData = Provider.of<WorkoutData>(context);
    final themeProvide = Provider.of<ThemeProvider>(context);

    String selectedWorkoutName = workoutData.getWorkoutNames()[0];

    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Lower Boddy',
            style: GoogleFonts.roboto(
                color: themeProvide.isDarkMode ? Colors.white : Colors.black),
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: value.getExercisesForWorkout(selectedWorkoutName).length,
          itemBuilder: (context, index) {
            final exercise =
                value.getExercisesForWorkout(selectedWorkoutName)[index];

            return ListTile(
              title: Stack(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 350,
                      height: 107,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xfff9e0e4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 20),
                    child: Text(
                      exercise.name,
                      style: GoogleFonts.robotoFlex(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 30,
                    child: Container(
                      width: 110,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: showTimerDialog,
                                icon: const Icon(
                                    Icons.access_time_filled_outlined),
                                color: Colors.black),
                            const SizedBox(width: 5),
                            Text(
                              '$_selectedMinutes min',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
