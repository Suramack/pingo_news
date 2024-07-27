class Article {
  final String author;
  final String title;
  final String url;
  final String publishedAt;

  Article({
    required this.author,
    required this.title,
    required this.url,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}