import 'package:flutter/material.dart';

class CalorieCounterPage extends StatefulWidget {
  @override
  _CalorieCounterPageState createState() => _CalorieCounterPageState();
}

class _CalorieCounterPageState extends State<CalorieCounterPage> {
  final Map<String, int> foodCalories = {
    'Apple': 95,
    'Banana': 105,
    'Orange': 62,
    'Rice (1 cup)': 205,
    'Chicken Breast (100g)': 165,
    'Egg (1)': 78,
    'Milk (1 cup)': 122,
    'Bread (1 slice)': 80,
  };

  String? selectedFood;
  int quantity = 1;
  int totalCalories = 0;

  void addCalories() {
    if (selectedFood != null && foodCalories.containsKey(selectedFood!)) {
      setState(() {
        totalCalories += (foodCalories[selectedFood!] ?? 0) * quantity;
      });
    }
  }

  void resetCalories() {
    setState(() {
      totalCalories = 0;
      selectedFood = null;
      quantity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Counter'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Select Food:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButton<String>(
                  value: selectedFood,
                  hint: const Text('Choose food'),
                  items: foodCalories.keys.map((food) {
                    return DropdownMenuItem<String>(
                      value: food,
                      child: Text(food),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFood = value;
                      quantity = 1; // Reset quantity when a new food is selected
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Select Quantity:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: quantity > 1
                          ? () {
                        setState(() {
                          quantity--;
                        });
                      }
                          : null,
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: addCalories,
                  child: const Text('Add Calories'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Total Calories:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '$totalCalories kcal',
                  style: const TextStyle(fontSize: 24, color: Colors.deepPurple),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: resetCalories,
                  child: const Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
