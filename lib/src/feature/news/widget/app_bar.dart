import 'package:flutter/material.dart';
import 'package:pingo_news/design_system/label/label.dart';
import 'package:pingo_news/design_system/widget/_widget.dart';

class BrandAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  const BrandAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BrandText(
        data: title ?? Strings.pingoNews,
      ),
      actions: const [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on,
            ),
            BrandText(
              data: 'IN',
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget get child => child;

  @override
  Size get preferredSize => const Size(double.infinity, 45);
}
