import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/widget/_widget.dart';
import 'package:pingo_news/src/theme/colors.dart';

abstract class BrandDialog {
  static showDialogs({required BuildContext context, String? message}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            BrandButton.primary(
              onTap: () {
                context.pop();
              },
              title: Strings.ok,
            )
          ],
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BrandText(
                data: message ?? Strings.alert,
              ),
            ),
          ),
        );
      },
    );
  }
}
