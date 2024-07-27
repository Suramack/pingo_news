import 'package:flutter/material.dart';
import 'package:pingo_news/design_system/font/brand_font.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/style/brand_space.dart';
import 'package:pingo_news/design_system/style/text_style.dart';
import 'package:pingo_news/design_system/widget/_widget.dart';
import 'package:pingo_news/src/theme/colors.dart';
import 'package:pingo_news/util/extentions/extensions.dart';

class NewsCard extends StatelessWidget {
  final String? imgUrl, title, description, time;
  final Function? onTap;
  const NewsCard({
    super.key,
    this.imgUrl,
    this.title,
    this.description,
    this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.white,
      ),
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 8, 16),
          child: Row(
            children: [
              SizedBox(
                width: context.deviceSize.width * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BrandText.secondary(
                      data: title ?? Strings.newsSource,
                      textStyle:
                          const BrandTextStyle(fontWeight: FontWeight.w600),
                    ),
                    const BrandVSpace(
                      height: BrandSpace.gap8,
                    ),
                    BrandText.secondary(
                      data: description ?? '',
                      textStyle:
                          const BrandTextStyle(fontWeight: FontWeight.w400),
                    ),
                    BrandText.grey(
                      data: time ?? '',
                      textStyle: const BrandTextStyle(
                        color: AppColor.greyDC,
                        fontSize: BrandFontSize.subtitle1,
                      ),
                    )
                  ],
                ),
              ),
              const BrandHSpace(
                width: BrandSpace.gap16,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  child: Container(
                    color: AppColor.greyFD,
                    width: context.deviceSize.width * 0.2,
                    height: context.deviceSize.width * 0.2,
                    child: imgUrl == null
                        ? const Icon(
                            Icons.image,
                          )
                        : Image.network(
                            imgUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
