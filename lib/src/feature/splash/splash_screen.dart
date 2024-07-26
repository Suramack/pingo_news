import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/style/text_style.dart';
import 'package:pingo_news/design_system/widget/brand_text.dart';
import 'package:pingo_news/route/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    /// check logged in or not and Navigate
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go(RouteName.signup);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: BrandText.primary(
              data: Strings.welcomeToPingoNews,
              textStyle: BrandTextStyle.brandTextStyle1,
            ),
          ),
        ],
      ),
    );
  }
}
