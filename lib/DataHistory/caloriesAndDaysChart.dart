import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/caloriesburned.dart';
import 'package:track_pro/provider/userdata.dart';

class CaloriesAndDaysChart extends StatefulWidget {
  const CaloriesAndDaysChart({super.key});

  @override
  _CaloriesAndDaysChartState createState() => _CaloriesAndDaysChartState();
}

class _CaloriesAndDaysChartState extends State<CaloriesAndDaysChart> {
  Map<int, double> caloriesByDay = {};

  @override
  void initState() {
    super.initState();
    fetchCaloriesData();
  }

  // Fetch and aggregate the data by day of the week
  void fetchCaloriesData() async {
    final userId = Provider.of<UserData>(context, listen: false).userId;
    final now = DateTime.now();
    final startOfWeek = now.subtract(
        Duration(days: now.weekday)); // Start of the current week (Monday)
    final endOfWeek =
        startOfWeek.add(Duration(days: 7)); // End of the current week (Sunday)

    // Query the Firestore collection to get the calories burned for the current week
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('TotalBurnedCaloriesPerDay')
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfWeek))
        .where('date', isLessThan: Timestamp.fromDate(endOfWeek))
        .get();

    // Reset the caloriesByDay map to zero for each day of the week
    caloriesByDay = {
      0: 0.0, // Monday
      1: 0.0, // Tuesday
      2: 0.0, // Wednesday
      3: 0.0, // Thursday
      4: 0.0, // Friday
      5: 0.0, // Saturday
      6: 0.0, // Sunday
    };

    // Aggregate calories burned by day of the week
    for (var doc in querySnapshot.docs) {
      final data = doc.data();
      final Timestamp timestamp = data['date'];
      final calories = data['totalCaloriesBurned'];
      final date = timestamp.toDate();

      // Calculate the day of the week (0 = Monday, 6 = Sunday)
      final dayOfWeek =
          date.weekday - 1; // Adjust to match Monday = 0, Sunday = 6
      caloriesByDay[dayOfWeek] = (caloriesByDay[dayOfWeek] ?? 0.0) + calories;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calories Burned Chart'),
      ),
      body: SizedBox(
        width: 600,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 90, right: 10),
          child: BarChart(
            BarChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  drawBelowEverything: false,
                ),
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
                rightTitles: AxisTitles(drawBelowEverything: false),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                    left: BorderSide(width: 1), bottom: BorderSide(width: 1)),
              ),
              barGroups: [
                // Create a bar for each day of the week using the aggregated data
                for (int i = 0; i < 7; i++)
                  BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: caloriesByDay[i] ??
                            0.0, // Calories burned for this day
                        color: Color(0xffb6c7ca),
                        width: 20,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
