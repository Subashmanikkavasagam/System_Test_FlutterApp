import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/screens/dashboard_screen.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../screens/signup_screen.dart';

import 'package:myflutterapp/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
              child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: CustomButton(
                text: 'Login',
                onPressed: () async {
                  print("Button pressed");

                  User? user = await authController.login(
                    emailController.text,
                    passwordController.text,
                  );

                  if (user != null) {
                    Get.offAll(DashboardScreen());
                  } else {
                    _showErrorDialog(context, "Invalid Credentials");
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextButton(
                  onPressed: () => Get.to(SignupScreen()),
                  child: Text("Don't u have an Account? Sign Up")),
            )
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String? message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Login Failed"),
        content: Text(message ?? "An unknown error occurred."),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
