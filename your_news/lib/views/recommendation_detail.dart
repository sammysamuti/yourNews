import 'package:flutter/material.dart';
import 'package:your_news/core/widgets/custom_app_bar.dart';
import 'package:your_news/models/news_model.dart';
import 'package:your_news/views/search_page.dart';

class RecommendationDetail extends StatelessWidget {
  final NewsModel recommendation;

  RecommendationDetail({required this.recommendation});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showMenu: false,
        showNotification: false,
        showSettings: false,
        showVerts: true,
        search: false,
        showBackButton: true,
        title: 'ForbesNews',
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
                  CircleAvatar(
                    backgroundImage: AssetImage(recommendation.imagePath),
                    radius: 28,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('6.8k News', style: TextStyle(fontSize: 11)),
                            SizedBox(width: 12),
                            Text('2.5k Followers',
                                style: TextStyle(fontSize: 11)),
                            SizedBox(width: 16),
                            Text('100 Following',
                                style: TextStyle(fontSize: 11)),
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
                              'Follow',
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
                recommendation.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                recommendation.news,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'News by Forbes',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
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
                          builder: (context) => SearchWithFiltersScreen()),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              _buildRecommendationItem(context, recommendation),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendationItem(
      BuildContext context, NewsModel recommendation) {
    return Card(
      color: Color(0xFFF9FCFE),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          recommendation.icon!,
                          width: double.infinity,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            ' ${recommendation.news}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(width: 3),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              recommendation.icon2!,
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        recommendation.date!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.more_vert, size: 24, color: Colors.grey[600]),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            recommendation.title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              minimumSize: Size(100, 36),
            ),
            child: Text(
              'Business',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              recommendation.imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
