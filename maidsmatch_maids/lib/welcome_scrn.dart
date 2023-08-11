import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:maidsmatch_maids/homepage.dart';
import 'package:maidsmatch_maids/profile.dart';
import 'package:maidsmatch_maids/notifications.dart'; 

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedPage(_selectedIndex),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.orangeAccent,
        gap: 8,
        padding: EdgeInsets.all(16),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
          GButton(
            icon: Icons.notifications_outlined,
            text: 'Notifications',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: _onTabTapped,
      ),
    );
  }

  Widget _getSelectedPage(int index) {
    switch (index) {
      case 0:
        return WelcomePage();
      case 1:
        return ProfilePage();
      case 2:
        return NotificationsPage();
      default:
        return Container();
    }
  }
}
