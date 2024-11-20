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
    // fetchCaloriesData();
  }

  // void fetchCaloriesData() async {
  //   final userId = Provider.of<UserData>(context, listen: false).userId;
  //   final now = DateTime.now();
  //   final newTotalBurnedCalories =
  //       Provider.of<CaloriesBurned>(context, listen: false).totalBurnedCalories;

  //   // Query Firestore for the latest entry
  //   final querySnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
  //       .collection('TotalBurnedCaloriesPerDay')
  //       .orderBy('date', descending: true) // Get the latest record
  //       .limit(1)
  //       .get();

  //   // Check if there's a new totalBurnedCalories value
  //   if (querySnapshot.docs.isEmpty ||
  //       querySnapshot.docs.first.data()['totalBurnedCalories'] !=
  //           newTotalBurnedCalories) {
  //     if (newTotalBurnedCalories != 0) {
  //       // Add the new record to Firestore
  //       FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(userId)
  //           .collection('TotalBurnedCaloriesPerDay')
  //           .add({
  //         'totalBurnedCalories': newTotalBurnedCalories,
  //         'date': Timestamp.fromDate(now),
  //       });
  //     }
  //   }

  //   // Get the current date and the date of 6 days ago
  //   final startOfWeek = now.subtract(Duration(days: 6)); // 6 days ago
  //   final endOfWeek = now; // Today

  //   // Query Firestore for calories burned data for the last 7 days (including today)
  //   final weeklySnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
  //       .collection('TotalBurnedCaloriesPerDay')
  //       .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfWeek))
  //       .where('date', isLessThanOrEqualTo: Timestamp.fromDate(endOfWeek))
  //       .orderBy('date') // Order by date to get them in order
  //       .get();

  //   // Reset the caloriesByDay map to zero for each day (0 = today, 6 = 6 days ago)
  //   caloriesByDay = {
  //     0: 0.0, // Today (0)
  //     1: 0.0, // Yesterday (1)
  //     2: 0.0, // 2 days ago (2)
  //     3: 0.0, // 3 days ago (3)
  //     4: 0.0, // 4 days ago (4)
  //     5: 0.0, // 5 days ago (5)
  //     6: 0.0, // 6 days ago (6)
  //   };

  //   // Aggregate calories burned by day (starting from 6 days ago up to today)
  //   for (var doc in weeklySnapshot.docs) {
  //     final data = doc.data();
  //     final Timestamp timestamp = data['date'];
  //     final calories =
  //         double.parse(data['totalBurnedCalories'].toStringAsFixed(1));
  //     final date = timestamp.toDate();

  //     // Calculate the difference in days between now and the recorded date
  //     final dayDifference = now.difference(date).inDays;

  //     if (dayDifference >= 0 && dayDifference <= 6) {
  //       caloriesByDay[dayDifference] =
  //           (caloriesByDay[dayDifference] ?? 0.0) + calories;
  //     }
  //   }

  //   setState(() {}); // Refresh the chart with the updated data
  // }

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
