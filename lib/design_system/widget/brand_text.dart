import 'package:flutter/material.dart';
import 'package:pingo_news/design_system/font/brand_font.dart';
import 'package:pingo_news/src/theme/colors.dart';

class BrandText extends StatelessWidget {
  final String data;
  final TextStyle? textStyle;
  const BrandText({
    super.key,
    required this.data,
    this.textStyle,
  });
  const BrandText.primary({
    super.key,
    required this.data,
    this.textStyle = const TextStyle(
      fontSize: BrandFontSize.subtitle1,
      color: AppColor.primary,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
  });
  const BrandText.secondary({
    super.key,
    required this.data,
    this.textStyle = const TextStyle(
      fontSize: BrandFontSize.subtitle2,
      color: AppColor.black,
      fontFamily: 'Poppins',
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: textStyle ?? textStyle,
    );
  }
}
