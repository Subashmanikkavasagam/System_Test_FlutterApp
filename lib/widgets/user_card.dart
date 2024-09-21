import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(
            '${(user.firstName[0]).toString().toUpperCase()}${(user.lastName[0]).toString().toUpperCase()}', // Initials
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        title: Text(
          '${user.firstName} ${user.lastName}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          user.email,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16.0,
          ),
        ),
        onTap: () {
          // Add your onTap functionality here
        },
      ),
    );
  }
}
