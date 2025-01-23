import 'package:flutter/material.dart';
import 'workout_session_page.dart';

class WorkoutDayPage extends StatelessWidget {
  final int day;
  final List<Map<String, dynamic>> workoutPlan;

  WorkoutDayPage({required this.day, required this.workoutPlan});

  @override
  Widget build(BuildContext context) {
    final dayData = workoutPlan.firstWhere((plan) => plan['day'] == day);

    if (dayData['isRestDay']) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Day $day - Rest Day'),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Text(
            'Enjoy your rest day!',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Day $day'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dayData['exercises'].length,
              itemBuilder: (context, index) {
                final exercise = dayData['exercises'][index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(
                      exercise['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.5,
                      ),
                    ),
                    subtitle: Text(
                      exercise['type'] == 'time'
                          ? '${exercise['value']} seconds'
                          : '${exercise['value']} reps',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                textStyle: const TextStyle(fontSize: 21),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutSessionPage(
                      day: day,
                      workoutPlan: dayData['exercises'],
                    ),
                  ),
                );
              },
              child: const Text(
                'Start Workout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
