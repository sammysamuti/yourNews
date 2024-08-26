import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showMenu;
  final bool showNotification;
  final bool showSettings;
  final bool showVerts;
  final bool search;
  final bool showBackButton;
  final String title;
  final VoidCallback onMenuPressed;
  final VoidCallback onNotificationPressed;
  final VoidCallback onSettingsPressed;
  final VoidCallback onVertsPressed;
  final VoidCallback? onBackPressed;
  final ValueChanged<String>? onSearchChanged;

  CustomAppBar({
    required this.showMenu,
    required this.showNotification,
    required this.showSettings,
    required this.showVerts,
    required this.search,
    required this.showBackButton,
    required this.title,
    required this.onMenuPressed,
    required this.onNotificationPressed,
    required this.onSettingsPressed,
    required this.onVertsPressed,
    this.onBackPressed,
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
      leading: showBackButton
          ? IconButton(
              icon: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Icon(Icons.arrow_back, color: Colors.black),
              ), 
              onPressed: onBackPressed,
            )
          : showMenu
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
              child: Icon(Icons.more_vert, color: Colors.black),
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
              child: Icon(Icons.notifications_none, color: Colors.black),
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
              child: Icon(Icons.settings, color: Colors.black),
            ),
            onPressed: onSettingsPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
