import 'package:flutter/material.dart';
import 'package:limetv/presentation/pages/sign/sign_code.dart';
import 'package:limetv/presentation/pages/sign/sign_page.dart';

import '../pages/main_page/landing_page.dart';
import '../pages/tv_page/tv_page.dart';

class Routes {
  static const signPage = '/signPage';
  static const signCodePage = '/signCodePage';
  static const landingPage = '/';
  static const tvPage = '/tvPage';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case landingPage:
          return MaterialPageRoute(
            builder: (context) {
              return const LandingPage();
            },
          );
        case tvPage:
          return MaterialPageRoute(
            builder: (context) {
              return const TVPage();
            },
          );

        case signPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const SignPage(),
          );
        case signCodePage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) =>  SignCodePage(number: args!['number']),
          );
        default:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const LandingPage(),
          );
      }
    } catch (e) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LandingPage(),
      );
    }
  }
}
