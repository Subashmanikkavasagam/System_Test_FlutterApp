import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myflutterapp/screens/gallery_screen.dart';
import 'package:myflutterapp/screens/login_screen.dart';
import 'package:myflutterapp/screens/user_list_screen.dart';
import 'expense_tracker_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    UsersListScreen(),
    GalleryScreen(),
    ExpenseTrackerScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _logout() {
    Get.to(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Expenses',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Users';
      case 1:
        return 'Gallery';
      case 2:
        return 'Expenses';
      default:
        return 'App';
    }
  }
}
