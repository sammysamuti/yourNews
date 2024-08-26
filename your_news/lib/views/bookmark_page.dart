import 'package:flutter/material.dart';
import 'package:your_news/core/widgets/custom_app_bar.dart';
import 'package:your_news/views/search_page.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPage createState() => _BookmarkPage();
}

class _BookmarkPage extends State<BookmarkPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        showMenu: false,
        showNotification: false,
        showSettings: false,
        showVerts: true,
        search: false,
        showBackButton: false,
        title: 'Bookmarks',
        onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onNotificationPressed: () {
          print('Notification pressed');
        },
        onSettingsPressed: () {},
        onVertsPressed: () {},
        onBackPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal collection of noteworthy reads',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF9FCFE),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search "News"',
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SearchWithFiltersScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  final cardData = [
                    {
                      'imageTop': 'assets/images/climate.jpeg',
                      'imageBottom1': 'assets/images/nature.jpeg',
                      'imageBottom2': 'assets/images/nature2.jpeg',
                      'title': 'Business',
                      'newsCount': '5 News',
                    },
                    {
                      'imageTop': 'assets/images/bbc.jpeg',
                      'imageBottom1': 'assets/images/fox_news.jpeg',
                      'imageBottom2': 'assets/images/nature2.jpeg',
                      'title': 'Technology',
                      'newsCount': '8 News',
                    },
                  ];

                  final data = cardData[index];

                  return Container(
                    width: 300,
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    color: Colors.transparent,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12.0)),
                              image: DecorationImage(
                                image: AssetImage(data['imageTop']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 75,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                      ),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(data['imageBottom1']!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12.0),
                                      ),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(data['imageBottom2']!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  data['title']!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text(data['newsCount']!,
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
