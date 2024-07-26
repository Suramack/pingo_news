import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pingo_news/design_system/font/brand_font.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/style/text_style.dart';
import 'package:pingo_news/design_system/widget/base_layout.dart';
import 'package:pingo_news/design_system/widget/brand_button.dart';
import 'package:pingo_news/design_system/widget/brand_rich_text.dart';
import 'package:pingo_news/design_system/widget/brand_sized_box.dart';
import 'package:pingo_news/design_system/widget/brand_text.dart';
import 'package:pingo_news/design_system/widget/brand_text_field.dart';
import 'package:pingo_news/route/route_name.dart';
import 'package:pingo_news/src/theme/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  void gotoLogin() {
    context.go(RouteName.login);
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
                  hintText: Strings.name,
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
              title: Strings.signup,
            ),
            const BrandVSpace(
              height: 10,
            ),
            BrandRichText(
              titleValue: Strings.alreadyHaveAnAccount,
              actionValue: Strings.login,
              onTap: () {
                gotoLogin();
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
