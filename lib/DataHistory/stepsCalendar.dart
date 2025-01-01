import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/userdata.dart';

class StepsCalendar extends StatefulWidget {
  const StepsCalendar({super.key});

  @override
  _StepsCalendarState createState() => _StepsCalendarState();
}

class _StepsCalendarState extends State<StepsCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  List<Map<String, dynamic>> _stepsData = [];
  Set<String> _daysWithSteps = Set<String>();

  @override
  void initState() {
    super.initState();

    fetchStepsForDay(_selectedDay);
    getAllDaysBeforeSelectedDay();
  }

  Future<void> fetchStepsForDay(DateTime day) async {
    final userId = Provider.of<UserData>(context, listen: false).userId;
    final startOfDay = DateTime(day.year, day.month, day.day);
    final endOfDay = startOfDay.add(Duration(days: 1));

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('steps')
          .where('timestamp',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
          .where('timestamp', isLessThan: Timestamp.fromDate(endOfDay))
          .get();

      final stepsData = querySnapshot.docs.where((doc) {
        return (doc['steps'] ?? 0) > 0;
      }).map((doc) {
        return {
          "steps": doc['steps'] ?? 0,
          "caloriesBurned": doc['caloriesBurned']?.toDouble() ?? 0.0,
          "duration": doc['duration'] ?? 0,
        };
      }).toList();

      setState(() {
        _stepsData = stepsData;

        if (_stepsData.isNotEmpty) {
          _daysWithSteps.add(_formatDate(day));
        }
      });
    } catch (e) {
      print("Error fetching steps data: $e");
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  void getAllDaysBeforeSelectedDay() {
    DateTime startOfMonth = DateTime(_selectedDay.year, _selectedDay.month, 1);
    for (DateTime day = _selectedDay.subtract(Duration(days: 1));
        day.isAfter(startOfMonth);
        day = day.subtract(Duration(days: 1))) {
      fetchStepsForDay(day);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Steps Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              fetchStepsForDay(selectedDay);
            },
            calendarFormat: CalendarFormat.month,
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, date, focusedDay) {
                return Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Color(0xffcf7496),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              defaultBuilder: (context, date, focusedDay) {
                if (_daysWithSteps.contains(_formatDate(date))) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text('${date.day}'),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _stepsData.isEmpty
                ? const Center(
                    child: Text("Click on the date to see steps data"))
                : ListView.builder(
                    itemCount: _stepsData.length,
                    itemBuilder: (context, index) {
                      final stepData = _stepsData[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xffcf7496),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 1.0,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Steps: ${stepData['steps']}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Calories Burned: ${stepData['caloriesBurned'].toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Duration: ${stepData['duration']} min',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
