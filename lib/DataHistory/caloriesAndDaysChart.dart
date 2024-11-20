import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/userdata.dart';

class CaloriesAndDaysChart extends StatefulWidget {
  const CaloriesAndDaysChart({super.key});

  @override
  _CaloriesAndDaysChartState createState() => _CaloriesAndDaysChartState();
}

class _CaloriesAndDaysChartState extends State<CaloriesAndDaysChart> {
  List<Map<String, dynamic>> _exercises = [];
  Map<String, double> _weeklyCalories = {}; // Store total calories per weekday

  @override
  void initState() {
    super.initState();
    fetchExercisesForWeek(); // Fetch exercises for the whole week
  }

  // Fetch exercises for the whole week (Monday to Sunday)
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

      final exercises = querySnapshot.docs.map((doc) {
        return {
          "name": doc['exerciseName'] ?? 'Unknown Exercise',
          "caloriesBurned": doc['caloriesBurned']?.toDouble() ?? 0.0,
          "date": (doc['date'] as Timestamp).toDate(),
        };
      }).toList();

      // Group exercises by day of the week (Monday to Sunday)
      Map<String, double> weeklyCalories = {};
      for (var exercise in exercises) {
        String dayOfWeek = _getDayOfWeek(exercise['date']);
        weeklyCalories[dayOfWeek] =
            (weeklyCalories[dayOfWeek] ?? 0.0) + exercise['caloriesBurned'];
      }

      setState(() {
        _exercises = exercises;
        _weeklyCalories = weeklyCalories;
      });
    } catch (e) {
      print("Error fetching exercises: $e");
    }
  }

  // Helper method to get the day of the week (e.g., Monday, Tuesday, etc.)
  String _getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Calories Burned'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _weeklyCalories.isEmpty
                ? const Center(child: Text("No exercises for the week."))
                : Expanded(
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY:
                            _getMaxCalories(), // Adjust max Y value dynamically
                        barTouchData: BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          // Show left Y-axis titles
                          bottomTitles: AxisTitles(
                            drawBelowEverything: true,
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                String title;
                                switch (value.toInt()) {
                                  case 0:
                                    title = 'M'; // Monday
                                    break;
                                  case 1:
                                    title = 'T'; // Tuesday
                                    break;
                                  case 2:
                                    title = 'W'; // Wednesday
                                    break;
                                  case 3:
                                    title = 'Th'; // Thursday
                                    break;
                                  case 4:
                                    title = 'F'; // Friday
                                    break;
                                  case 5:
                                    title = 'S'; // Saturday
                                    break;
                                  case 6:
                                    title = 'S'; // Sunday
                                    break;
                                  default:
                                    title = '';
                                }
                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  space: 8,
                                  child: Text(title),
                                );
                              },
                            ),
                          ),
                        ),
                        gridData: FlGridData(show: true),
                        borderData: FlBorderData(
                          show: true,
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 1),
                            left: BorderSide(color: Colors.black, width: 1),
                            top: BorderSide.none, // Remove top border
                            right: BorderSide.none, // Remove right border
                          ),
                        ),
                        barGroups: _weeklyCalories.entries.map((entry) {
                          int dayIndex = [
                            'Monday',
                            'Tuesday',
                            'Wednesday',
                            'Thursday',
                            'Friday',
                            'Saturday',
                            'Sunday'
                          ].indexOf(entry.key);

                          return BarChartGroupData(
                            x: dayIndex,
                            barRods: [
                              BarChartRodData(
                                toY: entry.value,
                                color: _getColorForDay(entry.key),
                                width: 20,
                                borderRadius: BorderRadius.zero,
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  // Helper method to return a color based on the day of the week
  Color _getColorForDay(String day) {
    switch (day) {
      case 'Monday':
        return Colors.blue;
      case 'Tuesday':
        return Colors.green;
      case 'Wednesday':
        return Colors.orange;
      case 'Thursday':
        return Colors.red;
      case 'Friday':
        return Colors.purple;
      case 'Saturday':
        return Colors.yellow;
      case 'Sunday':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  // Helper method to calculate the maximum Y value for the chart dynamically
  double _getMaxCalories() {
    double maxCalories = 0.0;
    _weeklyCalories.forEach((key, value) {
      if (value > maxCalories) {
        maxCalories = value;
      }
    });
    return maxCalories + 100; // Adding some buffer to the maximum value
  }
}
