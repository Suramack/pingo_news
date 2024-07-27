import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pingo_news/design_system/font/brand_font.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/style/text_style.dart';
import 'package:pingo_news/route/route_name.dart';
import 'package:pingo_news/src/theme/colors.dart';
import 'package:pingo_news/util/extentions/extensions.dart';
import 'package:pingo_news/util/regular_expression/regular_expression.dart';

import '../../../../../design_system/style/brand_space.dart';
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

  void loginOnTap() {
    bool isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      // TODO: check from firebase and fetch data
      context.go(RouteName.news);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Form(
        key: formKey,
        child: SizedBox(
          height: context.deviceSize.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BrandVSpace(
                        height: BrandSpace.gap40,
                      ),
                      const BrandText(
                        data: Strings.pingoNews,
                        textStyle: BrandTextStyle(
                          color: AppColor.primary,
                          fontSize: BrandFontSize.heeadline1,
                        ),
                      ),
                      BrandVSpace(
                        height: context.deviceSize.height * 0.2,
                      ),
                      BrandTextField(
                        hintText: Strings.email,
                        errorString: Strings.pleaseEnterEmail,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Strings.pleaseEnterEmail;
                          }
                          if (!RegularExpression.email.hasMatch(value)) {
                            return Strings.pleaseEnterAValidEmail;
                          }
                          return null;
                        },
                      ),
                      const BrandVSpace(
                        height: BrandSpace.gap14,
                      ),
                      const BrandTextField(
                        hintText: Strings.password,
                        errorString: Strings.pleaseEnterPassword,
                        obscureText: true,
                      ),
                      const BrandVSpace(
                        height: BrandSpace.gap14,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.deviceSize.width * 0.2,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: BrandButton.primary(
                              title: Strings.login,
                              fontWeight: FontWeight.w500,
                              onTap: () {
                                loginOnTap();
                              },
                            ),
                          ),
                        ],
                      ),
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
                      height: BrandSpace.gap60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
