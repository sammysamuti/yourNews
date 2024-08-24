import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:your_news/screens/auth/login_page.dart';
import 'package:your_news/core/constants/colors.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: [
                Image.network(
                  '',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Text(
            'First to know',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'All news in one place, be the first to know the latest news',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor.withOpacity(0.6),
              ),
            ),
          ),
          SizedBox(height: 20),
       ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: LoginPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor, 
              minimumSize: Size(200, 50), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
              elevation: 5, 
              shadowColor: Colors.black.withOpacity(0.3),
            ),
            child: Text('Get Started',style: TextStyle(color: Colors.white),),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
