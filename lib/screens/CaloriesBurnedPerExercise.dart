import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:track_pro/provider/caloriesburned.dart';
import 'package:intl/intl.dart';

var BurnedCaloriesPerExercise;

class Caloriesburnedperexercise extends StatefulWidget {
  const Caloriesburnedperexercise({super.key});

  @override
  State<Caloriesburnedperexercise> createState() =>
      _CaloriesburnedperexerciseState();
}

class _CaloriesburnedperexerciseState extends State<Caloriesburnedperexercise> {
  DateTime now = DateTime.now();

  // String timezone = 'Asia/Beirut';
  // late tz.TZDateTime convertedDateTime =
  //     tz.TZDateTime.from(dateTime, tz.getLocation(timezone));

  @override
  // void initState() {
  //   super.initState();
  //   convertedDateTime = tz.TZDateTime.from(dateTime, tz.getLocation(timezone));
  // }

  @override
  Widget build(BuildContext context) {
    // print(dateTime);
    String formattedDate = DateFormat('EEEE, M /d/ y').format(now);
    String formattedDay = DateFormat('EEEE').format(now);
    BurnedCaloriesPerExercise =
        Provider.of<CaloriesBurned>(context).caloriesBurned;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 60),
              child: Stack(children: [
                Container(
                  width: 330,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/fire.gif',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${BurnedCaloriesPerExercise.toStringAsFixed(2)} cal',
                        style: GoogleFonts.robotoSlab(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 20,
                  child: Text(
                    '${formattedDate}',
                    style: GoogleFonts.robotoSlab(fontSize: 15),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
