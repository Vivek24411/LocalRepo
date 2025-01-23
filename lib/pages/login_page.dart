import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vive/utils/routes.dart'; // Ensure to have your routes defined

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  bool changeButton = false;
  String errorMessage = ""; // Store error message

  // Function to authenticate user
  moveToHome(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
        errorMessage = ""; // Reset error message
      });
      await Future.delayed(Duration(seconds: 1));

      // Send POST request to Flask server for authentication
      const url = 'http://10.0.2.2:5000/login'; // Flask local server (use localhost for iOS)
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // If login is successful, navigate to the Home page
        await Navigator.pushNamed(context, MyRoutes.homeRoute);
      } else {
        // If login fails, show an error message and keep the button static
        setState(() {
          errorMessage = "Invalid credentials"; // Show error message
          changeButton = false; // Keep button static
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png", // Your login image path
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.0),
              Text(
                "Welcome $username",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        username = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        password = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 40.0),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                      BorderRadius.circular(8), // No animation, static button
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: 150, // Keep button width static
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                              : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.registrationRoute);
                      },
                      child: Text(
                        "Don't have an account? Register",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
