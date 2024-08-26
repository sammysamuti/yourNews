import 'package:flutter/material.dart';
import 'package:your_news/screens/auth/login_page.dart';
import 'package:get_storage/get_storage.dart';

class DrawerWidget extends StatelessWidget {
  final BuildContext context;

  const DrawerWidget({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              handleSignOut(context);
            },
          ),
        ],
      ),
    );
  }

  void handleSignOut(BuildContext context) {
    final GetStorage storage = GetStorage();
    try {
      storage.remove('loggedIn'); // Clears all data from GetStorage
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully signed out')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: $error')),
      );
    }
  }
}
