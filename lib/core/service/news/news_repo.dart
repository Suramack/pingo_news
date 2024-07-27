import 'package:pingo_news/core/service/news/news_service.dart';
import 'package:riverpod/riverpod.dart';

import '../../model/news/response_model/news_response_model.dart';

abstract class NewsRepo {
  Future<Article?> getTopHeadline();
}

final newsRepoProvider = Provider<NewsRepo>((ref) => NewsService());
