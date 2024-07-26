import 'package:flutter/material.dart';
import 'package:pingo_news/src/theme/colors.dart';

class BaseLayout extends StatelessWidget {
  final Widget? child;
  final PreferredSizeWidget? appBar;
  const BaseLayout({super.key, this.child, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.greyFD,
        appBar: appBar,
        resizeToAvoidBottomInset: false,
        body: child,
      ),
    );
  }
}
