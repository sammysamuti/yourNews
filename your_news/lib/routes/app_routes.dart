import 'package:get/get.dart';
import 'package:your_news/views/home_page.dart';
import 'package:your_news/views/discover_page.dart';
import 'package:your_news/views/bookmark_page.dart';
import 'package:your_news/views/profile_page.dart';
import 'package:your_news/screens/splash_screen.dart';
import 'package:your_news/views/onboarding_page.dart';
import 'package:your_news/screens/main_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String discover = '/discover';
  static const String bookmark = '/bookmark';
  static const String profile = '/profile';

  static final List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: onboarding,
      page: () => OnboardingPage(),
    ),
    GetPage(
      name: home,
      page: () => MainScreen(),
      children: [
        GetPage(name: '/home', page: () => HomePage(), title: 'Home'),
        GetPage(
            name: '/discover', page: () => DiscoverPage(), title: 'Discover'),
        GetPage(
            name: '/bookmark', page: () => BookmarkPage(), title: 'Bookmark'),
        GetPage(name: '/profile', page: () => ProfilePage(), title: 'Profile'),
      ],
    ),
  ];
}
