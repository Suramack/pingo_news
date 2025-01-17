import 'package:flutter/material.dart';
import 'package:pingo_news/design_system/font/brand_font.dart';
import 'package:pingo_news/design_system/style/brand_space.dart';
import 'package:pingo_news/design_system/style/text_style.dart';
import 'package:pingo_news/design_system/widget/brand_text.dart';
import 'package:pingo_news/src/theme/colors.dart';

class BrandButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color? bgColor, fontColor;
  final double borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  const BrandButton.primary({
    super.key,
    required this.onTap,
    required this.title,
    this.bgColor = AppColor.primary,
    this.fontColor = AppColor.white,
    this.borderRadius = 12,
    this.fontSize = BrandFontSize.heeadline3,
    this.fontWeight = FontWeight.w400,
  });
  const BrandButton({
    super.key,
    required this.onTap,
    required this.title,
    this.bgColor,
    this.fontColor,
    this.borderRadius = 12,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 20, minWidth: 40),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? AppColor.primary,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: BrandSpace.gap6),
              child: BrandText.primary(
                data: title,
                textStyle: BrandTextStyle(
                  color: fontColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
