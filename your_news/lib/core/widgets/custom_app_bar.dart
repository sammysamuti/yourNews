import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showMenu;
  final bool showNotification;
  final bool showSettings;
  final bool showVerts; // Vertical dots icon
  final bool search; // New parameter for search bar
  final String title;
  final VoidCallback onMenuPressed;
  final VoidCallback onNotificationPressed;
  final VoidCallback onSettingsPressed;
  final VoidCallback onVertsPressed;
  final ValueChanged<String>? onSearchChanged; // Callback for search input

  CustomAppBar({
    required this.showMenu,
    required this.showNotification,
    required this.showSettings,
    required this.showVerts,
    required this.search,
    required this.title,
    required this.onMenuPressed,
    required this.onNotificationPressed,
    required this.onSettingsPressed,
    required this.onVertsPressed,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: search
          ? TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: onSearchChanged,
            )
          : Text(title),
      centerTitle: true,
      elevation: 0,
      leading: showMenu
          ? IconButton(
              icon: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Icon(Icons.menu, color: Colors.black),
              ),
              onPressed: onMenuPressed,
            )
          : null,
      actions: [
        if (showVerts)
          IconButton(
            icon: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!, width: 1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Icon(Icons.more_vert,
                  color: Colors.black), // Vertical three dots
            ),
            onPressed: onVertsPressed,
          ),
        if (showNotification)
          IconButton(
            icon: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!, width: 1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Icon(Icons.notifications_none,
                  color: Colors.black), // Notification icon
            ),
            onPressed: onNotificationPressed,
          ),
        if (showSettings)
          IconButton(
            icon: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!, width: 1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Icon(Icons.settings, color: Colors.black), // Settings icon
            ),
            onPressed: onSettingsPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
