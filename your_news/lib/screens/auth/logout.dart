import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:your_news/screens/auth/login_page.dart';

void handleSignOut(BuildContext context) {
  final GetStorage storage = GetStorage();

  try {
    storage.erase(); // Clears all data from GetStorage

    // Optional: Show a confirmation or success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Successfully signed out')),
    );

    // Navigate to the LoginPage and replace the current route
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  } catch (error) {
    // Handle any potential errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error signing out: $error')),
    );
  }
}
