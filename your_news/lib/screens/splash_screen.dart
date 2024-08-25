import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:get_storage/get_storage.dart';
import 'package:your_news/controllers/onboarding_controller.dart';
import 'package:your_news/screens/auth/login_page.dart';
import 'package:your_news/views/onboarding_page.dart';
import 'package:your_news/views/home_page.dart'; 

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  void _checkOnboardingStatus() async {
    await Future.delayed(Duration(seconds: 3)); // Delay for splash screen

    // Checking if onboarding has been completed
    final box = GetStorage();
    bool onboardingCompleted = box.read('onboardingCompleted') ?? false;
    bool loggedIn = box.read('loggedIn') ?? false;

    // Navigating to the appropriate page
    if (onboardingCompleted) {
      if (loggedIn) {
        // If onboarding is completed and user is logged in, navigating to HomePage
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: HomePage(),
          ),
        );
      } else {
        // If onboarding is completed but user is not logged in, navigating to LoginPage
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: LoginPage(),
          ),
        );
      }
    } else {
      // If onboarding is not completed, navigating to OnboardingPage
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: OnboardingPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4263EB),
      body: Center(
        child: Image.asset('assets/images/yours_news.png'),
      ),
    );
  }
}
