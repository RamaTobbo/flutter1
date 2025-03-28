import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:track_pro/DataHistory/exercisesCalendar.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/caloriesburned.dart';
import 'package:track_pro/screens/CaloriesBurnedFromSteps.dart';
import 'package:track_pro/provider/themeprovider.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Caloriesburnedperexercise extends StatefulWidget {
  const Caloriesburnedperexercise({super.key});

  @override
  State<Caloriesburnedperexercise> createState() =>
      _CaloriesburnedperexerciseState();
}

class _CaloriesburnedperexerciseState extends State<Caloriesburnedperexercise> {
  DateTime now = DateTime.now();
  bool userNotUsingSmartWatch = true;
  Future<bool> fetchUserUsingSmartWatch(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUserId = prefs.getString('userId');
      Provider.of<UserData>(context, listen: false).setUserId(storedUserId!);
      print('idddd${storedUserId}');
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(storedUserId)
          .get();

      if (snapshot.exists) {
        debugPrint("Fetched user dataaaaa: ${snapshot.data()}");

        userNotUsingSmartWatch = snapshot['IsNotAsmartwatchUser'] ?? true;

        if (snapshot.data() != null) {
          if (mounted) {
            setState(() {
              userNotUsingSmartWatch = snapshot['IsNotAsmartwatchUser'] ?? true;
            });
          }
        } else {
          debugPrint("Field 'IsNotAsmartwatchUser' is missing.");
        }
      } else {
        debugPrint("No user found for the given ID.");
      }
    } catch (e) {
      debugPrint("Error fetching user information: $e");
    }
    return userNotUsingSmartWatch;
  }

  @override
  void initState() {
    super.initState();
    print(Provider.of<CaloriesBurned>(context, listen: false)
        .totalBurnedCalories);

    print(Provider.of<UserData>(context, listen: false).userId);

    Provider.of<CaloriesBurned>(context, listen: false)
        .fetchExercises(Provider.of<UserData>(context, listen: false).userId);
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, M/d/y').format(now);
    final exercises = Provider.of<CaloriesBurned>(context).exercisesh;
    final totalBurnedCalories =
        Provider.of<CaloriesBurned>(context).totalBurnedCalories;

    final isdarkmode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    // if (Provider.of<CaloriesBurned>(context, listen: false)
    //         .totalBurnedCalories !=
    //     0) {
    //   saveTotalBurnedCalories(
    //       Provider.of<UserData>(context, listen: false).userId,
    //       Provider.of<CaloriesBurned>(context, listen: false)
    //           .totalBurnedCalories,
    //       now);
    // }

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
                      'Workouts Total Burned Calories: ${Provider.of<CaloriesBurned>(context, listen: false).totalBurnedCalories.toStringAsFixed(2)} cal',
                      style: GoogleFonts.robotoSlab(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isdarkmode ? Colors.white : Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(18.0),
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = exercises[index];
                        final userId =
                            Provider.of<UserData>(context, listen: false)
                                .userId;

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
                                padding: const EdgeInsets.only(left: 100.0),
                                child: Text(
                                  '${exercise.exerciseName}',
                                  style: GoogleFonts.robotoSlab(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            onDismissed: (direction) {},
                            child: Container(
                              width: 330,
                              height: 110,
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
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          '${exercise.exerciseName}',
                                          style: GoogleFonts.robotoSlab(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
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
                                            fontSize: 20, color: Colors.black),
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
          onPressed: () async {
            bool isNotUsingSmartWatch = await fetchUserUsingSmartWatch(context);

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (ctx) =>
                    isNotUsingSmartWatch ? TabNav1(index: 3) : TabNav(index: 3),
              ),
              (Route) => true,
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      Positioned(
        top: 30,
        right: 30,
        child: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => ExerciseCalendar()));
          },
          icon: Icon(Icons.calendar_month),
        ),
      ),
      Positioned(
        top: 30,
        right: 60,
        child: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (ctx) => Caloriesburnedfromsteps()),
              (Route route) => false,
            );
          },
          icon: Icon(Icons.directions_walk),
          iconSize: 30,
        ),
      ),
    ]);
  }
}
