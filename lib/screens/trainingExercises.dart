import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/data/workout.dart';
import 'package:track_pro/provider/themeprovider.dart';

class Trainingexercises extends StatefulWidget {
  const Trainingexercises({super.key});

  @override
  State<Trainingexercises> createState() => _TrainingexercisesState();
}

class _TrainingexercisesState extends State<Trainingexercises> {
  Color _getColorForIndex(int index) {
    switch (index) {
      case 0:
        return const Color(0xfff9e0e4);
      case 1:
        return const Color(0xff8082a2);
      case 2:
        return const Color(0xffffdd7f);
      case 3:
        return const Color(0xffb6c7ca);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvide = Provider.of<ThemeProvider>(context);

    return Consumer<WorkoutData>(
      builder: (context, value, child) => Stack(
        children: [
          PopScope(
            canPop: false,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Workout',
                  style: GoogleFonts.roboto(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 350,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                color: _getColorForIndex(index),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Image.asset('assets/images/Heart.png'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.getWorkoutList().length,
                      itemBuilder: (context, index) {
                        final workout = value.getWorkoutList()[index];
                        return ListTile(
                          title: Stack(
                            children: [
                              Container(
                                width: 350,
                                height: 147,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: _getColorForIndex(index),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 20),
                                  child: Text(
                                    workout.name,
                                    style: themeProvide.isDarkMode
                                        ? GoogleFonts.robotoFlex(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)
                                        : GoogleFonts.robotoFlex(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 90,
                                left: 260,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: themeProvide.isDarkMode
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 90,
                                left: 30,
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
                                      children: [
                                        Icon(
                                          Icons.access_time_filled_outlined,
                                          color: themeProvide.isDarkMode
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${workout.exercise.map((e) => e.timer).reduce((a, b) => a + b)} min',
                                          style: TextStyle(
                                            color: themeProvide.isDarkMode
                                                ? Colors.black
                                                : Colors.grey,
                                          ),
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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 22,
            right: 20,
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.fire,
                color: themeProvide.isDarkMode ? Colors.red : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
