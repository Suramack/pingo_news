import 'package:flutter/material.dart';
import 'package:pingo_news/design_system/style/text_style.dart';
import 'package:pingo_news/design_system/widget/brand_text.dart';
import 'package:pingo_news/src/theme/colors.dart';

class BrandButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color? bgColor, fontColor;
  final double borderRadius;
   const BrandButton.primary({
    super.key,
    required this.onTap,
    required this.title,
    this.bgColor=AppColor.primary,
    this.fontColor=AppColor.white,
    this.borderRadius = 12,
  });
  const BrandButton({
    super.key,
    required this.onTap,
    required this.title,
    this.bgColor,
    this.fontColor,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 20, minWidth: 40),
      child: Container(
        decoration: BoxDecoration(
            color: bgColor ?? AppColor.primary,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: BrandText.primary(
            data: title,
            textStyle: BrandTextStyle(color: fontColor),
          ),
        ),
      ),
    );
  }
}
