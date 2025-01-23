import 'package:flutter/material.dart';
import 'package:vive/pages/activity_page.dart';
import 'package:vive/pages/login_page.dart';
import 'package:vive/pages/nutrition_plan.dart';
import 'package:vive/pages/profile_page.dart';
import 'package:vive/pages/splash_screen.dart';
import 'utils/routes.dart';
import 'package:vive/pages/registration_page.dart';
import 'pages/home_page.dart';
import 'package:vive/pages/workout_overview_page.dart';
import 'package:vive/pages/water_tracker.dart';
import 'package:vive/pages/calories_counter.dart';




void main() async{

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (context) =>  LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.registrationRoute: (context) => RegistrationPage(),
        MyRoutes.workoutoverviewRoute: (context) => WorkoutOverviewPage(),
        MyRoutes.watertrackerRoute: (context) => WaterTrackerPage(),
        "/calories_counter": (context) => CalorieCounterPage(),
        "/nutrition_plan": (context) => NutritionPlanPage(gender: "female", goal: "calorie deficiet"),
        "/profile_page": (context) => ProfilePage(username: "Arnav"),
        //"/splash_screen": (context) => SplashScreen(),



      },
    );
  }
}