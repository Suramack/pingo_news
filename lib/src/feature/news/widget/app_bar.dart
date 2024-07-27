import 'package:flutter/material.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/style/brand_space.dart';
import 'package:pingo_news/design_system/style/text_style.dart';
import 'package:pingo_news/design_system/widget/_widget.dart';
import 'package:pingo_news/src/theme/colors.dart';

class BrandAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  const BrandAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary,
      title: BrandText(
        data: title ?? Strings.pingoNews,
        textStyle: const BrandTextStyle(
          color: AppColor.white,
        ),
      ),
      actionsIconTheme: const IconThemeData(color: AppColor.white),
      actions: const [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on,
            ),
            BrandText(
              data: 'IN',
              textStyle: BrandTextStyle(
                  color: AppColor.white, fontWeight: FontWeight.w500),
            ),
            BrandHSpace(
              width: BrandSpace.gap20,
            )
          ],
        ),
      ],
    );
  }

  @override
  // ignore: recursive_getters
  Widget get child => child;

  @override
  Size get preferredSize => const Size(double.infinity, 45);
}
