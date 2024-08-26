import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the height of the screen using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 8,
        activeColor: Colors.black, // Set active icon and text color to black
        iconSize: 24,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: screenHeight * 0.02, // Increase padding using MediaQuery
        ),
        duration: Duration(milliseconds: 300),
        tabBackgroundColor:
            Colors.transparent, // Remove background color when selected
        color: Colors.black, // Set inactive icon and text color to black
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Discover',
          ),
          GButton(
            icon: Icons.bookmark_border,
            text: 'Bookmark',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
      ),
    );
  }
}
