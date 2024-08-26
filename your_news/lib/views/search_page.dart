import 'package:flutter/material.dart';
import 'package:your_news/core/widgets/custom_app_bar.dart';
import 'package:your_news/models/news_model.dart';

class SearchWithFiltersScreen extends StatefulWidget {
  @override
  _SearchWithFiltersScreenState createState() =>
      _SearchWithFiltersScreenState();
}

class _SearchWithFiltersScreenState extends State<SearchWithFiltersScreen> {
  List<String> _selectedFilters = [];
  String _selectedCategory = 'All';

  List<Map<String, String>> _articles = [
    {
      'title': 'Global Summit on Climate Change: Historic Agreement Reached',
      'subtitle': 'BBC News • Jun 9, 2023',
      'category': 'Politics',
    },
    {
      'title': 'Climate Change Impact on Agriculture: Farmers Seek Solutions',
      'subtitle': 'Reuters • Jun 8, 2023',
      'category': 'Health',
    },
  ];

  final trendingNews = [
    NewsModel(
      category: 'Environment',
      title: 'Global Summit on Climate Change: Historic Agreement Reached',
      news: 'BBC News',
      date: ' Jun 9, 2023',
      imagePath: 'assets/images/climate.jpeg',
      icon: 'assets/images/bbc.jpeg',
      icon2: 'assets/images/verified.png',
    ),
    NewsModel(
      category: 'Technology',
      title: 'Tech Giants Unveil New AI-powered Tools',
      news: 'NY Times',
      date: ' Jun 9, 2023',
      imagePath: 'assets/images/nature.jpeg',
      icon: 'assets/images/fox_news.jpeg',
      icon2: 'assets/images/verified.png',
    ),
  ];

  List<Map<String, String>> get _filteredArticles {
    if (_selectedFilters.isEmpty) return _articles;

    return _articles.where((article) {
      return _selectedFilters.contains(article['category']);
    }).toList();
  }

  void _openFilterScreen() {
    showModalBottomSheet(
      context: context,
      builder: (context) => FiltersBottomSheet(
        onFilterSelected: (selectedFilters) {
          setState(() {
            _selectedFilters = selectedFilters;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        showMenu: false,
        showNotification: false,
        showSettings: false,
        showVerts: false,
        search: true,
        showBackButton: true,
        title: '',
        onMenuPressed: () {
          Scaffold.of(context).openDrawer();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildFilterChip('This week'),
                _buildFilterChip('Politics'),
                _buildFilterChip('Health'),
                _buildFilterChip('World'),
                _buildFilterChip('Asia'),
                _buildFilterChip('South America'),
                ActionChip(
                  label: Text('Add Filter'),
                  onPressed: _openFilterScreen,
                  backgroundColor: Colors.blue[100],
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'News',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Publishers',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trendingNews.length,
              itemBuilder: (context, index) {
                final news = trendingNews[index];

                final imageWidth = screenWidth > 600 ? 100.0 : 85.0;
                final iconWidth = screenWidth > 600 ? 30.0 : 24.0;
                final textStyle = screenWidth > 600
                    ? TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                    : TextStyle(fontWeight: FontWeight.bold);

                return ListTile(
                  leading: Image.asset(news.imagePath!, width: imageWidth),
                  title: Text(
                    news.title,
                    style: textStyle,
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset(news.icon!, width: iconWidth),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          news.news,
                          style:
                              TextStyle(fontSize: 12), 
                        ),
                      ),
                      SizedBox(width: 8),
                      Image.asset(news.icon2!, width: iconWidth),
                      Spacer(),
                      Text(
                        news.date,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors
                                .grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedFilters.contains(label);

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (selected) {
            _selectedFilters.add(label);
          } else {
            _selectedFilters.remove(label);
          }
        });
      },
      selectedColor: Colors.blue,
      backgroundColor: Colors.white,
      selectedShadowColor: Colors.blueAccent,
      side: BorderSide(color: Colors.grey, width: 1),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.grey,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class FiltersBottomSheet extends StatefulWidget {
  final Function(List<String>) onFilterSelected;

  FiltersBottomSheet({required this.onFilterSelected});

  @override
  _FiltersBottomSheetState createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  List<String> _availableFilters = [
    'Politics',
    'Health',
    'World',
    'Asia',
    'South America'
  ];
  List<String> _selectedFilters = [];
  String _selectedDateRange = 'Last 7 Days';
  List<String> _locations = [
    'Asia',
    'Africa',
    'Europe',
    'North America',
    'South America'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          Container(
            height: 4,
            width: 40,
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Filters',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Works only for news',
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    SizedBox(height: 16),
                    Text('Date Range',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Column(
                      children: ['Last 7 Days', 'Last 30 Days', 'All Time']
                          .map((range) {
                        return RadioListTile<String>(
                          title: Text(range),
                          value: range,
                          groupValue: _selectedDateRange,
                          onChanged: (value) {
                            setState(() {
                              _selectedDateRange = value!;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                    Text('Categories (${_selectedFilters.length})',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: _availableFilters.map((filter) {
                        bool isSelected = _selectedFilters.contains(filter);

                        return FilterChip(
                          label: Text(filter),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedFilters.add(filter);
                              } else {
                                _selectedFilters.remove(filter);
                              }
                            });
                          },
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.white,
                          selectedShadowColor: Colors.blueAccent,
                          side: BorderSide(color: Colors.grey, width: 1),
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                    Text('Locations (${_selectedFilters.length})',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: _locations.map((location) {
                        bool isSelected = _selectedFilters.contains(location);

                        return FilterChip(
                          label: Text(location),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedFilters.add(location);
                              } else {
                                _selectedFilters.remove(location);
                              }
                            });
                          },
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.white,
                          selectedShadowColor: Colors.blueAccent,
                          side: BorderSide(color: Colors.grey, width: 1),
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedFilters.clear();
                          });
                        },
                        child: Text('Reset'),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () {
                          widget.onFilterSelected(_selectedFilters);
                          Navigator.of(context).pop();
                        },
                        child: Text('Done'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
