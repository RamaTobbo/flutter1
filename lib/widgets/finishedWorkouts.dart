import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_pro/screens/trainingExercises.dart';

class Finishedworkouts extends StatelessWidget {
  const Finishedworkouts(
      {super.key, required this.Workout, required this.repeatWorkout});
  final String Workout;
  final Function() repeatWorkout;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PopScope(
          canPop: false,
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/fire.gif'),
                  Text(
                    'No more $Workout workout left!',
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 128.0),
                    child: Row(
                      children: [
                        Text('repeat workout'),
                        IconButton(
                            onPressed: repeatWorkout, icon: Icon(Icons.repeat)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 30,
            right: 20,
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => Trainingexercises()));
                },
                child: Text(
                  'leave',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )))
      ],
    );
  }
}
