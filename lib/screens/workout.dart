import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/provider/themeprovider.dart';

class Workout1 extends StatefulWidget {
  const Workout1({super.key});

  @override
  State<Workout1> createState() => _Workout1State();
}

class _Workout1State extends State<Workout1> {
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
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.access_time_filled_outlined),
                                color: Colors.black),
                            const SizedBox(width: 5),
                            Text(
                              '${exercise.timer} min',
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
