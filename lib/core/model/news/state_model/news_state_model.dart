import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pingo_news/core/model/news/response_model/news_response_model.dart';

part 'news_state_model.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default([]) List<Article> articles,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
  }) = _NewsState;
}
