import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/loader/brand_loader.dart';
import 'package:pingo_news/design_system/style/brand_space.dart';
import 'package:pingo_news/design_system/style/text_style.dart';
import 'package:pingo_news/design_system/widget/base_layout.dart';
import 'package:pingo_news/design_system/widget/brand_text.dart';
import 'package:pingo_news/src/feature/news/provider/news_provider.dart';
import 'package:pingo_news/src/feature/news/widget/app_bar.dart';
import 'package:pingo_news/src/feature/news/widget/bottom_sheet.dart';
import 'package:pingo_news/src/feature/news/widget/news_card.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  NewsNotifier? _provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchNews();
    });
  }

  fetchNews() async {
    _provider?.getNews();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(newsProvider);
    _provider = ref.read(newsProvider.notifier);
    return BaseLayout(
      appBar: const BrandAppBar(
        title: Strings.pingoNews,
      ),
      child: ref.read(newsProvider).isLoading
          ? const BrandLoader()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: BrandSpace.gap16,
                    top: BrandSpace.gap16,
                  ),
                  child: BrandText(
                    data: Strings.topHeadLines,
                    textStyle: BrandTextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: ref.read(newsProvider).articles.map((e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: NewsCard(
                          title: e.source?.name,
                          description: e.description,
                          imgUrl: e.urlToImage,
                          time: DateTime.tryParse(e.publishedAt!) != null
                              ? DateFormat()
                                  .format(DateTime.tryParse(e.publishedAt!)!)
                              : '',
                          onTap: () {
                            NewsBottomsheet.showSheet(
                              context: context,
                              title: e.source?.name,
                              description: e.description,
                              imgUrl: e.urlToImage,
                              time: DateTime.tryParse(e.publishedAt!) != null
                                  ? DateFormat().format(
                                      DateTime.tryParse(e.publishedAt!)!)
                                  : '',
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
    );
  }
}
