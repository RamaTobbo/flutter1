import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/provider/themeprovider.dart';

class Workout3 extends StatefulWidget {
  const Workout3({super.key});

  @override
  State<Workout3> createState() => _Workout3State();
}

class _Workout3State extends State<Workout3> {
  @override
  Widget build(BuildContext context) {
    final workoutData = Provider.of<WorkoutData>(context);
    final themeProvide = Provider.of<ThemeProvider>(context);

    String selectedWorkoutName = workoutData.getWorkoutNames()[2];

    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Cardio',
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
                        color: Color(0xffffce48),
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
                            Icon(Icons.access_time_filled_outlined,
                                color: Colors.black),
                            const SizedBox(width: 5),
                            Text(
                              '${exercise.timer} min',
                              style: TextStyle(color: Colors.black),
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
