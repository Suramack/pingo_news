class Article {
  final String? author;
  final String? title;
  final String? url;
  final String? publishedAt;
  final String? description;
  final String? urlToImage;
  final Source? source;

  Article({
    this.author,
    this.title,
    this.url,
    this.publishedAt,
    this.description,
    this.urlToImage,
    this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      url: json['url'],
      publishedAt: json['publishedAt'] ?? '',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'],
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'title': title,
      'url': url,
      'publishedAt': publishedAt,
      'description': description,
      'urlToImage': urlToImage,
      'source': source,
    };
  }
}

class Source {
  final String? id;
  final String? name;
  const Source({this.id, this.name});
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }
}
