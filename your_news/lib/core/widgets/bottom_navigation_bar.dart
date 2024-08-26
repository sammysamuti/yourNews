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
    // to get the height of the screen using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;
    double bottomBarHeight = 70.0; // Setting a fixed height for the bottom bar

    return Container(
      height: bottomBarHeight, // Setting the height of the container
      color: Colors.white,
      child: GNav(
        rippleColor: Colors.transparent,
        hoverColor: Colors.transparent,
        gap: 8,
        activeColor: Colors.black,
        iconSize: 24,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: (bottomBarHeight - 24) / 2,
        ),
        duration: Duration(milliseconds: 300),
        tabBackgroundColor: Colors.transparent,
        color: Colors.grey,
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
