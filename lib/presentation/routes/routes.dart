import 'package:flutter/material.dart';
import 'package:limetv/presentation/pages/tv_page/tv_page.dart';

import '../pages/landing_page/landing_page.dart';
import '../pages/settings_page/settings_page.dart';

class Routes {
  static const landingPage = '/landingPage';
  static const tvPage = '/tvPage';
  static const settingsPage = '/';

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
        case settingsPage:
          return MaterialPageRoute(
            builder: (context) {
              return const SettingsPage();
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
