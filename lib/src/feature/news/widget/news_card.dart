import 'package:flutter/material.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/style/brand_space.dart';
import 'package:pingo_news/design_system/widget/_widget.dart';
import 'package:pingo_news/src/theme/colors.dart';

class NewsCard extends StatelessWidget {
  final String? imgUrl, title, description, time;
  const NewsCard({
    super.key,
    this.imgUrl,
    this.title,
    this.description,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColor.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 8, 16),
        child: Row(
          children: [
            Column(
              children: [
                BrandText.secondary(
                  data: title ?? Strings.newsSource,
                ),
                const BrandVSpace(
                  height: BrandSpace.gap8,
                ),
                BrandText.secondary(
                  data: description ?? '',
                ),
                BrandText.grey(data: time ?? '')
              ],
            ),
            const BrandHSpace(
              width: BrandSpace.gap16,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              child: SizedBox(
                width: 150,
                height: 150,
                child: imgUrl == null
                    ? const Icon(
                        Icons.image,
                      )
                    : Image.network(imgUrl!),
              ),
            )
          ],
        ),
      ),
    );
  }
}
