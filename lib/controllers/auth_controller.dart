import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/model/user_model.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myflutterapp/screens/login_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> register(
      String firstName, String lastName, String email, String password) async {
    // Validate email format
    if (!EmailValidator.validate(email)) {
      print('Invalid email format.');
      return 'Invalid email format.';
    }

    try {
      // Attempt to create the user
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create a UserModel instance
      UserModel user = UserModel(
        uid: userCredential.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );

      // Store user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid) // Use UID as document ID
          .set(user.toJson())
          .then((_) {
        print('DocumentSnapshot added with ID: ${user.uid}');
      }).catchError((error) {
        print('Error adding document: $error');
      });

      // Navigate to the Login screen

      return "Registered SuccessFully";
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      switch (e.code) {
        case 'weak-password':
          return 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          return 'The account already exists for that email.';
          break;
        case 'invalid-email':
          return 'The email address is not valid.';
          break;
        default:
          return 'Registration error: ${e.message}';
      }
    } catch (e) {
      // Handle any unexpected errors
      print('An unexpected error occurred: $e');
    }
    return '';
  }

  Future<User?> login(String email, String password) async {
    try {
      print("Logging in with email: $email");

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      print("Login failed: $e");
      return null; // Handle error as needed
    }
  }
}
