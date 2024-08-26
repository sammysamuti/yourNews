class NewsModel {
  final String category;
  final String title;
  final String date;
  final String news;
  final String imagePath;
  final String? icon;
  final String? icon2;

  NewsModel({
    required this.category,
    required this.title,
    required this.news,
    required this.date,
    required this.imagePath,
    this.icon,
    this.icon2,
  });
}
