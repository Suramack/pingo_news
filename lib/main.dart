import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_news/route/navigation_service.dart';
import 'package:pingo_news/route/routes.dart';
import 'package:pingo_news/src/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pingo News',
      scaffoldMessengerKey: NavigationService.scaffoldMessengerKey,
      theme: Themes.lightTheme(),
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
