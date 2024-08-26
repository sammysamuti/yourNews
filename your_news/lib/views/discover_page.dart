import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:your_news/core/widgets/bottom_navigation_bar.dart';
import 'package:your_news/core/widgets/drawer.dart';
import 'package:your_news/core/widgets/custom_app_bar.dart';
import 'package:your_news/models/news_model.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPage createState() => _DiscoverPage();
}

class _DiscoverPage extends State<DiscoverPage> {
  int _currentIndex = 0;
  String username = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() {
    final GetStorage storage = GetStorage();
    final email = storage.read('email') ?? '';
    final parts = email.split('@');
    if (parts.isNotEmpty) {
      setState(() {
        username = parts[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        showMenu: true,
        showNotification: true,
        showSettings: false,
        showVerts: false,
        search: false,
        title: '',
        onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onNotificationPressed: () {
          print('Notification pressed');
        },
        onSettingsPressed: () {},
        onVertsPressed: () {},
      ),
      drawer: DrawerWidget(context: context),
      body: SingleChildScrollView(),
   
    );
  }
}
