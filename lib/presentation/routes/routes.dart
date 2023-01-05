import 'package:flutter/material.dart';
import 'package:limetv/presentation/pages/filter_page/filter_page.dart';

import '../pages/main_page/main_page.dart';

class Routes {
  static const filterPage = '/filterPage';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case filterPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const FilterPage(),
          );
        default:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const MainPage(),
          );
      }
    } catch (e) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MainPage(),
      );
    }
  }
}
