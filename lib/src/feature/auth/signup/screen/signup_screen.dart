import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pingo_news/design_system/font/brand_font.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/style/brand_space.dart';
import 'package:pingo_news/design_system/style/text_style.dart';
import 'package:pingo_news/design_system/widget/base_layout.dart';
import 'package:pingo_news/design_system/widget/brand_button.dart';
import 'package:pingo_news/design_system/widget/brand_rich_text.dart';
import 'package:pingo_news/design_system/widget/brand_sized_box.dart';
import 'package:pingo_news/design_system/widget/brand_text.dart';
import 'package:pingo_news/design_system/widget/brand_text_field.dart';
import 'package:pingo_news/route/route_name.dart';
import 'package:pingo_news/src/theme/colors.dart';
import 'package:pingo_news/util/extentions/extensions.dart';
import 'package:pingo_news/util/regular_expression/regular_expression.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  void gotoLogin() {
    context.go(RouteName.login);
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
                      const BrandVSpace(
                        height: BrandSpace.gap50,
                      ),
                      const BrandTextField(
                        hintText: Strings.name,
                        errorString: Strings.pleaseEnterName,
                      ),
                      const BrandVSpace(
                        height: BrandSpace.gap14,
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
                      const BrandTextField(
                        hintText: Strings.confirmPassword,
                        errorString: Strings.pleaseEnterConfirmPassword,
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
                              title: Strings.signup,
                              fontWeight: FontWeight.w500,
                              onTap: () {
                                formKey.currentState?.validate();
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
                      titleValue: Strings.alreadyHaveAnAccount,
                      actionValue: Strings.login,
                      onTap: () {
                        gotoLogin();
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
