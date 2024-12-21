import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/provider/steps.dart';

import 'package:track_pro/provider/userdata.dart';

class BarChartSample1 extends StatefulWidget {
  BarChartSample1({super.key});

  final Color barBackgroundColor = Colors.grey;
  final Color barColor = AppColors.contentColorPurple;
  final Color touchedBarColor = AppColors.contentColorPurple;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Duration animDuration = const Duration(milliseconds: 250);
  double steps = 0;
  double totalSteps = 0.0;

  int touchedIndex = -1;
  bool isPlaying = false;

  // List of colors for each bar
  final List<Color> barColors = [
    AppColors.contentColorPurple,
    AppColors.contentColorYellow,
    AppColors.contentColorBlue,
    AppColors.contentColorPink,
    AppColors.contentColorPurple,
    AppColors.contentColorPink,
    AppColors.contentColorBlue,
  ];
  List<PieChartSectionData> _getPieChartSections() {
    return _weeklystepsCalories.entries.map((entry) {
      double calories = steps * 0.04;
      Color sectionColor;

      switch (entry.key) {
        case "Monday":
          sectionColor = AppColors.contentColorPurple;
          break;
        case "Tuesday":
          sectionColor = AppColors.contentColorYellow;
          break;
        case "Wednesday":
          sectionColor = AppColors.contentColorBlue;
          break;
        case "Thursday":
          sectionColor = AppColors.contentColorPink;
          break;
        case "Friday":
          sectionColor = AppColors.contentColorPurple;
          break;
        case "Saturday":
          sectionColor = AppColors.contentColorPink;
          break;
        case "Sunday":
          sectionColor = AppColors.contentColorBlue;
          break;
        default:
          sectionColor = Colors.grey;
      }

      return PieChartSectionData(
        value: calories,
        color: sectionColor,
        title: '${entry.key}\n${calories.toStringAsFixed(1)} kcal',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      );
    }).toList();
  }

  void _fetchTotalStepCount() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    if (userId != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      try {
        // Fetch all steps for the user
        QuerySnapshot snapshot = await firestore
            .collection('users')
            .doc(userId)
            .collection('steps')
            .orderBy('timestamp',
                descending: true) // Optional: You can order by timestamp
            .get(); // No limit to fetch all documents

        if (snapshot.docs.isNotEmpty) {
          double totalSteps = 0.0;

          // Sum all the steps
          for (var doc in snapshot.docs) {
            var stepsData = doc['steps'];
            if (stepsData != null) {
              // Ensure the value is treated as a double, even if it's stored as an integer
              totalSteps += (stepsData is int)
                  ? stepsData.toDouble()
                  : stepsData.toDouble();
            }
          }

          // Update the total steps value
          steps = totalSteps;
          Provider.of<Steps>(context, listen: false).setTotalSteps(totalSteps);
        } else {
          print('No steps found for the user.');
        }
      } catch (e) {
        print('Error fetching total step count: $e');
      }
    } else {
      print('User ID not found in SharedPreferences.');
    }
  }

  // Store weekly calories data
  Map<String, double> _weeklyCalories = {
    "Monday": 0.0,
    "Tuesday": 0.0,
    "Wednesday": 0.0,
    "Thursday": 0.0,
    "Friday": 0.0,
    "Saturday": 0.0,
    "Sunday": 0.0,
  };
  Map<String, double> _weeklystepsCalories = {
    "Monday": 0.0,
    "Tuesday": 0.0,
    "Wednesday": 0.0,
    "Thursday": 0.0,
    "Friday": 0.0,
    "Saturday": 0.0,
    "Sunday": 0.0,
  };
  @override
  void initState() {
    super.initState();
    _fetchTotalStepCount();
    fetchStepsForWeek();
    fetchExercisesForWeek();
  }

  Future<void> fetchStepsForWeek() async {
    final userId = Provider.of<UserData>(context, listen: false).userId;
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(
        Duration(days: now.weekday - 1)); // Start of this week (Monday)
    DateTime endOfWeek =
        startOfWeek.add(Duration(days: 6)); // End of this week (Sunday)

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('steps')
          .where('timestamp',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfWeek))
          .where('timestamp',
              isLessThan: Timestamp.fromDate(endOfWeek.add(Duration(days: 1))))
          .get();

      final steps = querySnapshot.docs.map((doc) {
        return {
          "steps": doc['steps'],
          "caloriesBurned": doc['caloriesBurned']?.toDouble() ?? 0.0,
          "timestamp": (doc['timestamp'] as Timestamp).toDate(),
        };
      }).toList();

      // Sum calories for each day
      Map<String, double> weeklystepsCalories = {};
      for (var step in steps) {
        String dayOfWeek = _getDayOfWeek(step['timestamp']);
        weeklystepsCalories[dayOfWeek] =
            (weeklystepsCalories[dayOfWeek] ?? 0.0) + step['caloriesBurned'];
      }

      setState(() {
        _weeklystepsCalories = weeklystepsCalories;
      });
    } catch (e) {
      print("Error fetching steps: $e");
    }
  }

  Future<void> fetchExercisesForWeek() async {
    final userId = Provider.of<UserData>(context, listen: false).userId;
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(
        Duration(days: now.weekday - 1)); // Start of this week (Monday)
    DateTime endOfWeek =
        startOfWeek.add(Duration(days: 6)); // End of this week (Sunday)

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('exercises')
          .where('date',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfWeek))
          .where('date',
              isLessThan: Timestamp.fromDate(endOfWeek.add(Duration(days: 1))))
          .get();

      final steps = querySnapshot.docs.map((doc) {
        return {
          "name": doc['exerciseName'] ?? 'Unknown Exercise',
          "caloriesBurned": doc['caloriesBurned']?.toDouble() ?? 0.0,
          "date": (doc['date'] as Timestamp).toDate(),
        };
      }).toList();

      // Group exercises by day of the week (Monday to Sunday)
      Map<String, double> weeklyCalories = {};
      for (var step in steps) {
        String dayOfWeek = _getDayOfWeek(step['date']);
        weeklyCalories[dayOfWeek] =
            (weeklyCalories[dayOfWeek] ?? 0.0) + step['caloriesBurned'];
      }

      setState(() {
        _weeklyCalories = weeklyCalories;
      });
    } catch (e) {
      print("Error fetching exercises: $e");
    }
  }

  String _getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return "Monday";
      case DateTime.tuesday:
        return "Tuesday";
      case DateTime.wednesday:
        return "Wednesday";
      case DateTime.thursday:
        return "Thursday";
      case DateTime.friday:
        return "Friday";
      case DateTime.saturday:
        return "Saturday";
      case DateTime.sunday:
        return "Sunday";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Burned Calories'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Text(
              'Bunred Calories From Exercises:',
              style:
                  GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(
                          height: 4,
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: BarChart(
                              mainBarData(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 38.0, top: 30),
                          child: Text(
                            'Burned Calories From Steps:',
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: PieChart(
                              PieChartData(
                                sections: _getPieChartSections(),
                                borderData: FlBorderData(show: false),
                                centerSpaceRadius: 40,
                                sectionsSpace: 0,
                                startDegreeOffset: 90,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    barColor ??= barColors[x];
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.black)
              : const BorderSide(color: Colors.black, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, _weeklyCalories["Monday"] ?? 0.0,
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, _weeklyCalories["Tuesday"] ?? 0.0,
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, _weeklyCalories["Wednesday"] ?? 0.0,
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, _weeklyCalories["Thursday"] ?? 0.0,
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, _weeklyCalories["Friday"] ?? 0.0,
                isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, _weeklyCalories["Saturday"] ?? 0.0,
                isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, _weeklyCalories["Sunday"] ?? 0.0,
                isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: 10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toStringAsFixed(2),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(
        show: true,
        border: Border(
          left: BorderSide(color: Color(0xff37434d), width: 1),
          bottom: BorderSide(color: Color(0xff37434d), width: 1),
        ),
      ),
      barGroups: showingGroups(),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
    );
    String text = value.toInt().toString();
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }
}

class AppColors {
  static const Color contentColorPurple = Color(0xFF8082a2);
  static const Color contentColorYellow = Color(0xFFffce48);
  static const Color contentColorBlue = Color(0xFF96afb3);
  static const Color contentColorPink = Color(0xFFf9e0e4);
}
