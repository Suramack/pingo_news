import 'package:pingo_news/core/model/news/response_model/news_response_model.dart';

class BaseDynamicResponse {
  final String status;
  final int totalResults;
  final List<Article>? articles;
  final String? message;

  BaseDynamicResponse({
    required this.status,
    required this.totalResults,
    this.articles,
    this.message,
  });

  factory BaseDynamicResponse.fromJson(Map<String, dynamic> json) {
    // Convert the articles from JSON
    List<Article> articles = (json['articles'] as List<dynamic>)
        .map((articleJson) =>
            Article.fromJson(articleJson as Map<String, dynamic>))
        .toList();

    return BaseDynamicResponse(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: articles,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((article) => article.toJson()).toList(),
      'message': message,
    };
  }
}
