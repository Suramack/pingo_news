import 'dart:convert';

import 'package:pingo_news/core/model/base_dynamic_response/base_dynamic_response.dart';
import 'package:pingo_news/core/model/news/response_model/news_response_model.dart';
import 'package:pingo_news/core/network/end_point.dart';
import 'package:pingo_news/core/network/network.dart';
import 'package:pingo_news/core/service/news/news_repo.dart';
import 'package:pingo_news/util/enum/network_status.dart';

class NewsService implements NewsRepo {
  @override
  Future<Article?> getTopHeadline() async {
    var response = await NetworkClient.get(
      endPoint: '${EndPoint.topHeadline}?country=IN',
    );
    if (response?.statusCode == NetworkStatus.status200.statusCode) {
      var json = jsonDecode(response?.body ?? '');
      var k = BaseDynamicResponse<Article>.fromJson(json);
      print(k.articles as Article);
      //  return k;
    }

    return null;
  }
}

