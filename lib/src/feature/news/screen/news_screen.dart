import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/widget/base_layout.dart';
import 'package:pingo_news/design_system/widget/brand_text.dart';
import 'package:pingo_news/src/feature/news/provider/news_provider.dart';
import 'package:pingo_news/src/feature/news/widget/app_bar.dart';
import 'package:pingo_news/src/feature/news/widget/news_card.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchNews();
    });
  }

  fetchNews() async {
    ref.read(newsProvider.notifier).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      appBar: BrandAppBar(
        title: Strings.pingoNews,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BrandText(
              data: Strings.topHeadLines,
            ),
            // TODO: call API and fetch the news
            NewsCard()
          ],
        ),
      ),
    );
  }
}
