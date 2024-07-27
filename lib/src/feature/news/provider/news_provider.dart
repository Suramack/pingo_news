import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_news/core/service/news/news_repo.dart';

import '../../../../core/model/news/state_model/news_state_model.dart';

final newsProvider = StateNotifierProvider<NewsNotifier, NewsState>(
  (ref) => NewsNotifier(ref),
);

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(this.ref) : super(const NewsState());
  final Ref ref;

  Future<void> getNews() async {
  await  ref.read(newsRepoProvider).getTopHeadline();
  }
}
