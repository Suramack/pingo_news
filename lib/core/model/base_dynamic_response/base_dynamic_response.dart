class BaseDynamicResponse <T> {
  final String status;
  final int totalResults;
  final dynamic articles;
  final String? message;

  BaseDynamicResponse({
    required this.status,
    required this.totalResults,
    this.articles,
    this.message,
  });

  factory BaseDynamicResponse.fromJson(Map<String, dynamic> json) {
    return BaseDynamicResponse(
        status: json['status'] as String,
        totalResults: json['totalResults'] as int,
        articles: json['articles'] as T,
        message: json['message'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles,
      'message': message,
    };
  }
}
