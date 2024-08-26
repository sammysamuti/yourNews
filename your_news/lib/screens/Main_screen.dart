import 'package:flutter/material.dart';
import 'package:your_news/core/widgets/bottom_navigation_bar.dart';
import 'package:your_news/views/home_page.dart';
import 'package:your_news/views/discover_page.dart';
import 'package:your_news/views/bookmark_page.dart';
import 'package:your_news/views/profile_page.dart';
import 'package:your_news/core/widgets/drawer.dart';
import 'package:your_news/core/widgets/custom_app_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    HomePage(),
    DiscoverPage(),
    BookmarkPage(),
    ProfilePage(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _currentIndex == 0
          ? CustomAppBar(
              showMenu: true,
              showNotification: true,
              showSettings: false,
              showVerts: false,
              search: false,
              showBackButton: false,
              title: '',
              onMenuPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              onNotificationPressed: () {
                print('Notification pressed');
              },
              onSettingsPressed: () {},
              onVertsPressed: () {},
              onBackPressed: () {},
            )
          : null,
      drawer: DrawerWidget(context: context),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _currentIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}
