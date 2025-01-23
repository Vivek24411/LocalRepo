import 'package:flutter/material.dart';

class NutritionPlanPage extends StatefulWidget {
  final String gender;
  final String goal; // "Calorie Deficit", "Bulking", or "Normal" consumption

  NutritionPlanPage({required this.gender, required this.goal});

  @override
  _NutritionPlanPageState createState() => _NutritionPlanPageState();
}

class _NutritionPlanPageState extends State<NutritionPlanPage> {
  Map<String, dynamic> samplePlan = {};

  @override
  void initState() {
    super.initState();
    generateNutritionPlan();
  }

  void generateNutritionPlan() {
    // Example plans based on gender and goal
    if (widget.gender == "Male" && widget.goal == "Calorie Deficit") {
      samplePlan = {
        "Day 1": [
          {"Meal": "Breakfast", "Food": "Oatmeal with banana", "Calories": 250, "Protein": 7, "Carbs": 45, "Fats": 5},
          {"Meal": "Lunch", "Food": "Grilled chicken salad", "Calories": 350, "Protein": 35, "Carbs": 20, "Fats": 15},
          {"Meal": "Dinner", "Food": "Steamed vegetables with quinoa", "Calories": 300, "Protein": 10, "Carbs": 50, "Fats": 10},
        ],
        "Day 2": [
          {"Meal": "Breakfast", "Food": "Greek yogurt with berries", "Calories": 200, "Protein": 15, "Carbs": 20, "Fats": 5},
          {"Meal": "Lunch", "Food": "Grilled salmon with broccoli", "Calories": 400, "Protein": 30, "Carbs": 10, "Fats": 20},
          {"Meal": "Dinner", "Food": "Turkey meatballs with zoodles", "Calories": 300, "Protein": 25, "Carbs": 15, "Fats": 10},
        ]
      };
    } else if (widget.gender == "Female" && widget.goal == "Bulking") {
      samplePlan = {
        "Day 1": [
          {"Meal": "Breakfast", "Food": "Avocado toast with eggs", "Calories": 350, "Protein": 15, "Carbs": 30, "Fats": 20},
          {"Meal": "Lunch", "Food": "Chicken stir-fry with rice", "Calories": 450, "Protein": 40, "Carbs": 50, "Fats": 10},
          {"Meal": "Dinner", "Food": "Beef stew with mashed potatoes", "Calories": 500, "Protein": 35, "Carbs": 60, "Fats": 20},
        ]
      };
    } else {
      samplePlan = {
        "Day 1": [
          {"Meal": "Breakfast", "Food": "Smoothie with protein powder", "Calories": 300, "Protein": 20, "Carbs": 30, "Fats": 10},
          {"Meal": "Lunch", "Food": "Grilled chicken sandwich", "Calories": 400, "Protein": 35, "Carbs": 40, "Fats": 10},
          {"Meal": "Dinner", "Food": "Pasta with marinara sauce", "Calories": 350, "Protein": 10, "Carbs": 60, "Fats": 5},
        ]
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition Plan'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Goal: ${widget.goal}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Gender: ${widget.gender}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ...samplePlan.entries.map((dayEntry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dayEntry.key,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  ...dayEntry.value.map<Widget>((meal) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 3,
                      child: ListTile(
                        title: Text(meal['Meal']),
                        subtitle: Text('${meal['Food']}\nCalories: ${meal['Calories']}\nProtein: ${meal['Protein']}g\nCarbs: ${meal['Carbs']}g\nFats: ${meal['Fats']}g'),
                      ),
                    );
                  }).toList(),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
