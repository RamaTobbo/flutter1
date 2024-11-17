import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/caloriesburned.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/userdata.dart';

class Caloriesburnedperexercise extends StatefulWidget {
  const Caloriesburnedperexercise({super.key});

  @override
  State<Caloriesburnedperexercise> createState() =>
      _CaloriesburnedperexerciseState();
}

class _CaloriesburnedperexerciseState extends State<Caloriesburnedperexercise> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Fetch exercises from Firestore when the widget is first created
    print(Provider.of<UserData>(context, listen: false).userId);
    Provider.of<CaloriesBurned>(context, listen: false)
        .fetchExercises(Provider.of<UserData>(context, listen: false).userId);
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, M/d/y').format(now);
    final exercises = Provider.of<CaloriesBurned>(context).exercisesh;

    double totalBurnedCaloriesFromWorkouts =
        exercises.fold(0, (sum, exercise) => sum + exercise.caloriesBurned);

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text('Burned Calories'),
          ),
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
                                  '${exercise.exerciseName}',
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            onDismissed: (direction) {},
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
                                          '${exercise.exerciseName}',
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
                                        style: GoogleFonts.robotoSlab(
                                            fontSize: 20),
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
      ),
      Positioned(
          top: 30,
          child: IconButton(
              onPressed: Provider.of<Isasmartwatchuser>(context, listen: false)
                      .isNotUsingSmartwatch
                  ? () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (ctx) => TabNav1()),
                          (Route) => false);
                    }
                  : () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (ctx) => TabNav1()),
                          (Route) => false);
                    },
              icon: Icon(Icons.arrow_back)))
    ]);
  }
}
