import 'dart:async';
import 'package:flutter/material.dart';
import 'package:your_news/controllers/onboarding_controller.dart';
import 'package:your_news/core/constants/colors.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late OnboardingController _controller;
  Timer? _autoSlideTimer;
  int _currentIndex = 0; // Track the current page index

  @override
  void initState() {
    super.initState();
    _controller = OnboardingController(context);

    _autoSlideTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentIndex < _controller.onboardingData.length - 1) {
        _controller.pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _controller.pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _controller.pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < _controller.onboardingData.length - 1) {
      _controller.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _controller.navigateToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed:
                    _controller.navigateToLogin, // Navigate to login page
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller.pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: _controller.onboardingData.length,
                itemBuilder: (context, index) {
                  double scale = (index == _currentIndex) ? 1.0 : 0.7;
                  double offset = (index == _currentIndex) ? 0.0 : 20.0;

                  return Transform.translate(
                    offset: Offset(offset, 0),
                    child: Transform.scale(
                      scale: scale,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              _controller.onboardingData[index].imagePath,
                              height: 350.0,
                              width: 300.0,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              _controller.onboardingData.length,
                              (dotIndex) => _buildDotIndicator(dotIndex),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            _controller.onboardingData[index].title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              _controller.onboardingData[index].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textColor.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _nextPage, // Navigate to the next page
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.3),
              ),
              child: Text(
                _currentIndex == _controller.onboardingData.length - 1
                    ? 'Get Started'
                    : 'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: _currentIndex == index ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: _currentIndex == index ? AppColors.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
