import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:track_pro/provider/caloriesburned.dart';

class Caloriesburnedperexercise extends StatefulWidget {
  const Caloriesburnedperexercise({super.key});

  @override
  State<Caloriesburnedperexercise> createState() =>
      _CaloriesburnedperexerciseState();
}

class _CaloriesburnedperexerciseState extends State<Caloriesburnedperexercise> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, M/d/y').format(now);
    final exercises = Provider.of<CaloriesBurned>(context).exercises;

    double totalBurnedCaloriesFromWorkouts =
        exercises.fold(0, (sum, exercise) => sum + exercise.caloriesBurned);

    return Scaffold(
      appBar: AppBar(
        title: Text('Burned Calories'),
      ),
      body: exercises.isEmpty
          ? Center(child: Text("No exercises recorded."))
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Total Burned Calories: ${totalBurnedCaloriesFromWorkouts.toStringAsFixed(2)} cal',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(18.0),
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = exercises[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Colors.amber,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 108.0),
                              child: Text(
                                '${exercise.name}',
                                style: GoogleFonts.robotoSlab(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onDismissed: (direction) {
                            Provider.of<CaloriesBurned>(context, listen: false)
                                .exercises
                                .removeAt(index);
                          },
                          child: Container(
                            width: 330,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xffffdd7f),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 78.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        formattedDate,
                                        style: GoogleFonts.robotoSlab(
                                            fontSize: 15),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        '${exercise.name}',
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/fire.gif',
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '${exercise.caloriesBurned.toStringAsFixed(2)} cal',
                                      style:
                                          GoogleFonts.robotoSlab(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
