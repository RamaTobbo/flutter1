import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/userdata.dart';

class ExerciseCalendar extends StatefulWidget {
  const ExerciseCalendar({super.key});

  @override
  _ExerciseCalendarState createState() => _ExerciseCalendarState();
}

class _ExerciseCalendarState extends State<ExerciseCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  List<Map<String, dynamic>> _exercises = [];
  Set<String> _daysWithExercises = Set<
      String>(); // Use String to store 'yyyy-MM-dd' format to avoid issues with DateTime comparisons

  @override
  void initState() {
    super.initState();
    // Fetch exercises for today and for previous days
    fetchExercisesForDay(_selectedDay);
    getAllDaysBeforeSelectedDay(); // Populate days before selected day
  }

  // Fetch exercises for a specific day
  Future<void> fetchExercisesForDay(DateTime day) async {
    final userId = Provider.of<UserData>(context, listen: false).userId;
    final startOfDay = DateTime(day.year, day.month, day.day);
    final endOfDay = startOfDay.add(Duration(days: 1));

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('exercises')
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
          .where('date', isLessThan: Timestamp.fromDate(endOfDay))
          .get();

      final exercises = querySnapshot.docs.map((doc) {
        return {
          "name": doc['exerciseName'] ?? 'Unknown Exercise',
          "caloriesBurned": doc['caloriesBurned']?.toDouble() ?? 0.0,
        };
      }).toList();

      setState(() {
        _exercises = exercises;
        // Mark the day as having exercises
        if (_exercises.isNotEmpty) {
          _daysWithExercises
              .add(_formatDate(day)); // Add formatted date string to the set
        }
      });
    } catch (e) {
      print("Error fetching exercises: $e");
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
      fetchExercisesForDay(day);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Calendar'),
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
              fetchExercisesForDay(selectedDay);
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
                if (_daysWithExercises.contains(_formatDate(date))) {
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
            child: _exercises.isEmpty
                ? const Center(
                    child: Text("Click on the date to see exercises done"))
                : ListView.builder(
                    itemCount: _exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = _exercises[index];
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
                              exercise['name'],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Calories Burned: ${exercise['caloriesBurned'].toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white70,
                              ),
                            ),
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
