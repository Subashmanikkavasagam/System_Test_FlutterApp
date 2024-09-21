import 'package:flutter/material.dart';
import 'package:myflutterapp/screens/login_screen.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'package:myflutterapp/widgets/custom_button.dart';

class SignupScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
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
              "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
              child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
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
              padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
              child: TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
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
                  )),
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
              padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
              child: CustomButton(
                text: 'Register',
                onPressed: () async {
                  String message = await authController.register(
                      firstNameController.text,
                      lastNameController.text,
                      emailController.text,
                      passwordController.text);

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Signup Status"),
                      content: Text(message ?? "An unknown error occurred."),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () => Get.to(LoginScreen()),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
