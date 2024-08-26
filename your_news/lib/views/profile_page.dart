import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:your_news/core/widgets/bottom_navigation_bar.dart';
import 'package:your_news/core/widgets/drawer.dart';
import 'package:your_news/core/widgets/custom_app_bar.dart';
import 'package:your_news/models/news_model.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        showMenu: false,
        showNotification: false,
        showSettings: true,
        showVerts: false,
        search: false,
        showBackButton: false,
        title: 'Profile',
        onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onNotificationPressed: () {
          print('Notification pressed');
        },
        onSettingsPressed: () {},
        onVertsPressed: () {},
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/mark.png'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('0 News', style: TextStyle(fontSize: 14)),
                            SizedBox(width: 12),
                            Text('5 Followers', style: TextStyle(fontSize: 14)),
                            SizedBox(width: 16),
                            Text('10 Following',
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: Size(double.infinity, 36),
                            ),
                            child: Text(
                              'Create News',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'News title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '$username news',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your News',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Sorted by:'),
                          SizedBox(width: 8),
                          DropdownButton<String>(
                            value: 'Newest',
                            items: <String>['Newest', 'Oldest']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.view_list),
                          SizedBox(width: 8),
                          Icon(Icons.grid_view),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Center(
                  child: Text(
                    "You don't have any news, make some.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
