import 'package:flutter/material.dart';
import 'package:pingo_news/design_system/font/brand_font.dart';
import 'package:pingo_news/src/theme/colors.dart';

class BrandTextStyle extends TextStyle {
  static const brandTextStyle1 = TextStyle(
    fontSize: BrandFontSize.heeadline1,
    color: AppColor.black,
    fontWeight: FontWeight.w400,
  );
  static const brandTextStyle2 = TextStyle(
    fontSize: BrandFontSize.body,
    color: AppColor.black,
    fontWeight: FontWeight.w400,
  );
  @override
  // ignore: overridden_fields
  final Color? color;
  @override
  // ignore: overridden_fields
  final double? fontSize;
  @override
  // ignore: overridden_fields
  final FontWeight? fontWeight;
  const BrandTextStyle({
    this.color,
    this.fontSize,
    this.fontWeight,
  });
}
