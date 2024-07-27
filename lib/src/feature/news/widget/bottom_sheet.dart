import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pingo_news/design_system/widget/_widget.dart';
import 'package:pingo_news/src/theme/colors.dart';
import 'package:pingo_news/util/extentions/extensions.dart';

import '../../../../design_system/font/brand_font.dart';
import '../../../../design_system/label/label.dart';
import '../../../../design_system/style/brand_space.dart';
import '../../../../design_system/style/text_style.dart';

class NewsBottomsheet {
  static showSheet({
    required BuildContext context,
    String? title,
    String? description,
    String? time,
    String? imgUrl,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 16, 8, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: Container(
                        color: AppColor.greyFD,
                        width: context.deviceSize.width * 0.5,
                        height: context.deviceSize.width * 0.2,
                        child: imgUrl == null
                            ? const Icon(
                                Icons.image,
                              )
                            : Image.network(
                                imgUrl,
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                    ),
                    const BrandVSpace(
                      height: BrandSpace.gap10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: context.deviceSize.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BrandText.secondary(
                                data: title ?? Strings.newsSource,
                                textStyle: const BrandTextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              const BrandVSpace(
                                height: BrandSpace.gap8,
                              ),
                              BrandText.secondary(
                                data: description ?? '',
                                textStyle: const BrandTextStyle(
                                    fontWeight: FontWeight.w400),
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
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.deviceSize.width * 0.2,
                  ),
                  child: BrandButton.primary(
                    onTap: () {
                      context.pop();
                    },
                    title: Strings.ok,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
