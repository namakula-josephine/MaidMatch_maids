import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:maidsmatch_maids/admin/adminpage.dart';

import '../notifications.dart';
import '../profile.dart';
import '../utils/app_styles.dart';

class botttomnav extends StatefulWidget {
  const botttomnav({super.key});

  @override
  State<botttomnav> createState() => _botttomnavState();
}

class _botttomnavState extends State<botttomnav> {

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
        backgroundColor: Styles.backgColor,
        color: Colors.black,
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
        return AdminDash();
      case 1:
        return ProfilePage();
      case 2:
        return NotificationsPage();
      default:
        return Container();
    }
  }
}