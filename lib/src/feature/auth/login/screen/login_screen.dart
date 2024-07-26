import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pingo_news/design_system/font/brand_font.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/style/text_style.dart';
import 'package:pingo_news/route/route_name.dart';
import 'package:pingo_news/src/theme/colors.dart';

import '../../../../../design_system/widget/_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  gotoSignup() {
    context.go(RouteName.signup);
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BrandText(
                  data: Strings.pingoNews,
                  textStyle: BrandTextStyle(
                    color: AppColor.primary,
                    fontSize: BrandFontSize.heeadline1,
                  ),
                ),
                BrandVSpace(
                  height: 50,
                ),
                BrandTextField(
                  hintText: Strings.email,
                ),
                BrandTextField(
                  hintText: Strings.password,
                ),
              ],
            ),
            BrandButton.primary(
              onTap: () {},
              title: Strings.login,
            ),
            const BrandVSpace(
              height: 10,
            ),
            BrandRichText(
              titleValue: Strings.newHere,
              actionValue: Strings.signup,
              onTap: () {
                gotoSignup();
              },
            ),
            const BrandVSpace(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
