import 'package:flutter/material.dart';
import 'package:limetv/presentation/pages/tv_page/tv_page.dart';

import '../pages/main_page/landing_page.dart';

class Routes {
  static const landingPage = '/';
  static const tvPage = '/tvPage';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic>? args = routeSettings.arguments as Map<String, dynamic>?;
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
