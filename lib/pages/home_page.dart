import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> profile = {};

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() async {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fitness App",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _buildCard(
                  context,
                  "Workout",
                  Icons.fitness_center,
                  Colors.blue,
                      () {
                    Navigator.pushNamed(context, "/workout_overview");
                  },
                ),
                _buildCard(
                  context,
                  "Nutrition Plan",
                  Icons.restaurant_menu,
                  Colors.green,
                      () {
                    Navigator.pushNamed(context, "/nutrition_plan");
                  },
                ),
                _buildCard(
                  context,
                  "Calories Counter",
                  Icons.calculate,
                  Colors.orange,
                      () {
                    Navigator.pushNamed(context, "/calories_counter");
                  },
                ),
                _buildCard(
                  context,
                  "Profile",
                  Icons.person,
                  Colors.purple,
                      () {
                    Navigator.pushNamed(context, "/profile_page");
                  },
                ),
                _buildCard(
                  context,
                  "My Activity",
                  Icons.timeline,
                  Colors.red,
                      () {
                    print("My Activity section clicked");
                  },
                ),
                _buildCard(
                  context,
                  "Water Tracker",
                  Icons.local_drink,
                  Colors.cyan,
                      () {
                    Navigator.pushNamed(context, "/water_tracker");
                  },
                ),
                _buildCard(
                  context,
                  "Workout Tracker",
                  Icons.track_changes,
                  Colors.teal,
                      () {
                    print("Workout Tracker section clicked");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context,
      String title,
      IconData icon,
      Color color,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(width: 400,
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color, width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 50, color: color),
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}