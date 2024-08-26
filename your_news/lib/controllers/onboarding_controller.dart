import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:your_news/screens/auth/login_page.dart';
import 'package:your_news/core/constants/colors.dart';
import 'package:your_news/models/onboarding_model.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final box = GetStorage();
  int currentPage = 0;
  bool _isNavigating = false; // Flag to prevent concurrent navigation

  final List<OnboardingContent> onboardingData = [
    OnboardingContent(
      imagePath: 'assets/images/first.png',
      title: 'First to know',
      description:
          'All news in one place, be the first to know the latest news',
    ),
    OnboardingContent(
      imagePath: 'assets/images/second.png',
      title: 'Stay Updated',
      description: 'Receive updates on the latest events as they happen.',
    ),
    OnboardingContent(
      imagePath: 'assets/images/third.png',
      title: 'Real-time Information',
      description: 'Access real-time information from trusted sources.',
    ),
  ];

  void onPageChanged(int index) {
    currentPage = index;
    update();
  }

  void navigateToLogin() {
    if (_isNavigating) return;
    _isNavigating = true;
    box.write('onboardingCompleted', true);
    Future.delayed(Duration(milliseconds: 300), () {
      Get.offAll(() => LoginPage(), transition: Transition.rightToLeft);
    }).whenComplete(() => _isNavigating = false);
  }

  Widget buildDotIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: currentPage == index ? 16.0 : 8.0,
      decoration: BoxDecoration(
        color: currentPage == index
            ? AppColors.primaryColor
            : AppColors.textColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
