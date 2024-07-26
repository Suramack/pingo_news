import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pingo_news/route/route_name.dart';
import 'package:pingo_news/src/feature/auth/login/screen/login_screen.dart';
import 'package:pingo_news/src/feature/auth/signup/screen/signup_screen.dart';
import 'package:pingo_news/src/feature/news/screen/news_screen.dart';
import 'package:pingo_news/src/feature/splash/splash_screen.dart';

/// The route configuration.
final GoRouter routerConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RouteName.slpash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RouteName.signup,
      builder: (BuildContext context, GoRouterState state) {
        return const SignupScreen();
      },
    ),
    GoRoute(
      path: RouteName.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: RouteName.news,
      builder: (BuildContext context, GoRouterState state) {
        return const NewsScreen();
      },
    ),
  ],
);
