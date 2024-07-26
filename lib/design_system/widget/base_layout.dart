import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget? child;
  final PreferredSizeWidget? appBar;
  const BaseLayout({super.key, this.child, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: child,
    );
  }
}
