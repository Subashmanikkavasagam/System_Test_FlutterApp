import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../widgets/user_card.dart';

class UsersListScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (userController.users.isEmpty) {
          return Center(child: Text('No users found.'));
        } else {
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              return UserCard(user: userController.users[index]);
            },
          );
        }
      }),
    );
  }
}
