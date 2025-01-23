import 'package:flutter/material.dart';
import '../utils/workout_plan_generator.dart';
import 'workout_day_page.dart';

class WorkoutOverviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> workoutPlan = generateWorkoutPlan();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Plan', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: workoutPlan.length,
        itemBuilder: (context, index) {
          final dayData = workoutPlan[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                dayData['isRestDay']
                    ? 'Day ${dayData['day']} - Rest Day'
                    : 'Day ${dayData['day']}',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: dayData['isRestDay']
                  ? null
                  : Text(
                '${dayData['exercises'].length} exercises',
                style: TextStyle(color: Colors.grey[700]),
              ),
              trailing: Icon(
                dayData['isRestDay'] ? Icons.hotel : Icons.fitness_center,
                color: dayData['isRestDay'] ? Colors.blueGrey : Colors.green,
              ),
              onTap: dayData['isRestDay']
                  ? null
                  : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutDayPage(
                      day: dayData['day'],
                      workoutPlan: workoutPlan,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
