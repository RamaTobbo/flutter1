import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/caloriesburned.dart';

class Caloriesanddayschart extends StatefulWidget {
  const Caloriesanddayschart({super.key});

  @override
  State<Caloriesanddayschart> createState() => _CaloriesanddayschartState();
}

class _CaloriesanddayschartState extends State<Caloriesanddayschart> {
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
                  rightTitles: AxisTitles(drawBelowEverything: false)),
              borderData: FlBorderData(
                show: true,
                border: Border(
                    left: BorderSide(width: 1), bottom: BorderSide(width: 1)),
              ),
              barGroups: [
                BarChartGroupData(
                  x: 0, // Day 1
                  barRods: [
                    BarChartRodData(
                      toY: (Provider.of<CaloriesBurned>(context, listen: false)
                                      .totalBurnedCalories *
                                  100)
                              .roundToDouble() /
                          100, // Calories burned on Day 1
                      color: Color(0xffb6c7ca),
                      width: 20,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 1, // Day 2
                  barRods: [
                    BarChartRodData(
                      toY: 4, // Calories burned on Day 2
                      color: Color(0xffb6c7ca),
                      width: 20,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 2, // Day 3
                  barRods: [
                    BarChartRodData(
                      toY: 3, // Calories burned on Day 3
                      color: Color(0xffb6c7ca),
                      width: 20,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 3, // Day 3
                  barRods: [
                    BarChartRodData(
                      toY: 6, // Calories burned on Day 3
                      color: Color(0xffb6c7ca),
                      width: 20,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
                // Add more days as needed
                BarChartGroupData(
                  x: 4, // Day 3
                  barRods: [
                    BarChartRodData(
                      toY: 7, // Calories burned on Day 3
                      color: Color(0xffb6c7ca),
                      width: 20,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 5, // Day 3
                  barRods: [
                    BarChartRodData(
                      toY: 5, // Calories burned on Day 3
                      color: Color(0xffb6c7ca),
                      width: 20,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 6, // Day 3
                  barRods: [
                    BarChartRodData(
                      toY: 7, // Calories burned on Day 3
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
