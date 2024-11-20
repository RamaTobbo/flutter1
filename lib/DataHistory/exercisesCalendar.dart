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
  Set<DateTime> _daysWithExercises =
      Set<DateTime>(); // Track days with exercises

  @override
  void initState() {
    super.initState();
    // Fetch exercises for today on initial load
    fetchExercisesForDay(_selectedDay);
  }

  Future<void> fetchExercisesForDay(DateTime day) async {
    final userId = Provider.of<UserData>(context, listen: false).userId;

    // Setting up the start and end of the day
    final startOfDay = DateTime(day.year, day.month, day.day);
    final endOfDay = startOfDay.add(Duration(days: 1));

    try {
      // Query Firestore for exercises on the selected day
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('exercises')
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
          .where('date', isLessThan: Timestamp.fromDate(endOfDay))
          .get();

      // If exercises are found, update the state
      final exercises = querySnapshot.docs.map((doc) {
        return {
          "name": doc['exerciseName'] ?? 'Unknown Exercise', // Handle null
          "caloriesBurned":
              doc['caloriesBurned']?.toDouble() ?? 0.0, // Handle null
        };
      }).toList();

      setState(() {
        _exercises = exercises;
        // Mark the selected day as having exercises if there are any
        if (_exercises.isNotEmpty) {
          _daysWithExercises
              .add(day); // Add this day to the list of exercised days
        }
      });
    } catch (e) {
      print("Error fetching exercises: $e");
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
          // TableCalendar widget for selecting days
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
              fetchExercisesForDay(
                  selectedDay); // Fetch exercises when day is selected
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
              // Highlight past days with exercises in gray
              defaultBuilder: (context, date, focusedDay) {
                if (_daysWithExercises.contains(date)) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.grey, // Gray color for days with exercises
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text('${date.day}'),
                    ),
                  );
                }
                return null; // Default rendering for days without exercises
              },
            ),
          ),
          const SizedBox(height: 20),
          // Display exercises for the selected day
          Expanded(
            child: _exercises.isEmpty
                ? const Center(child: Text("No exercises for this day."))
                : ListView.builder(
                    itemCount: _exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = _exercises[index];
                      return ListTile(
                        title: Text(exercise['name']),
                        subtitle: Text(
                            'Calories Burned: ${exercise['caloriesBurned'].toStringAsFixed(2)}'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
