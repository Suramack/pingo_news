import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_news/core/service/news/news_repo.dart';

import '../../../../core/model/news/response_model/news_response_model.dart';
import '../../../../core/model/news/state_model/news_state_model.dart';

final newsProvider = StateNotifierProvider<NewsNotifier, NewsState>(
  (ref) => NewsNotifier(ref),
);

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(this.ref) : super(const NewsState());
  final Ref ref;

  List<Article> get newsList => state.articles;

  Future<void> getNews() async {
    state = state.copyWith(isLoading: true, isError: false);
    var list = await ref.read(newsRepoProvider).getTopHeadline();
    if (list == null) {
      state = state.copyWith(isError: true, isLoading: false);
    } else {
      state = state.copyWith(articles: list, isError: false, isLoading: false);
    }
  }
}
