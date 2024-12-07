import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:track_pro/provider/isAsmartWatchuser.dart';
import 'package:track_pro/provider/userdata.dart';
import 'package:track_pro/screens/tab.dart';
import 'package:track_pro/screens/trainingExercises.dart';

class Finishedworkouts extends StatefulWidget {
  const Finishedworkouts(
      {super.key, required this.Workout, required this.repeatWorkout});
  final String Workout;
  final Function() repeatWorkout;

  @override
  State<Finishedworkouts> createState() => _FinishedworkoutsState();
}

class _FinishedworkoutsState extends State<Finishedworkouts> {
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
  Widget build(BuildContext context) {
    print(
        "Is the user using smartwatch? ${Provider.of<Isasmartwatchuser>(context, listen: false).isNotUsingSmartwatch}");

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
                    'No more ${widget.Workout} workout left!',
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 128.0),
                    child: Row(
                      children: [
                        Text('repeat workout'),
                        IconButton(
                            onPressed: widget.repeatWorkout,
                            icon: Icon(Icons.repeat)),
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
                onPressed: () async {
                  bool isNotUsingSmartWatch =
                      await fetchUserUsingSmartWatch(context);

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => isNotUsingSmartWatch
                          ? TabNav1(index: 3)
                          : TabNav(index: 3),
                    ),
                    (Route) => true,
                  );
                },
                child: Text(
                  'leave',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )))
      ],
    );
  }
}
