import 'package:flutter/material.dart';
import 'package:limetv/presentation/pages/sign/sign_code.dart';
import 'package:limetv/presentation/pages/sign/sign_page.dart';

import '../pages/main_page/main_page.dart';

class Routes {
  static const signPage = '/';
  static const signCodePage = '/signCodePage';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
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
