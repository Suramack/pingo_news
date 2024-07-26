import 'package:flutter/material.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/widget/brand_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BrandText(
          data: Strings.welcomeToPingoNews,
        ),
      ],
    );
  }
}
