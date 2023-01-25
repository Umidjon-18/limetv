import 'package:limetv/presentation/mobile_pages/pages/main_page/main_page.dart';
import 'package:limetv/presentation/mobile_pages/pages/sign/sign_code.dart';
import 'package:limetv/presentation/mobile_pages/pages/sign/sign_page.dart';
import 'package:limetv/presentation/pages/main_page/main_page.dart';
import 'package:limetv/presentation/pages/my_page/favorite_page.dart';
import 'package:limetv/presentation/pages/tv_page/tv_page.dart';
import '../pages/landing_page/landing_page.dart';
import '../pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:limetv/presentation/pages/sign/sign_code.dart';
import 'package:limetv/presentation/pages/sign/sign_page.dart';
import 'package:limetv/presentation/pages/tv_page/tv_video_player_page.dart';

import 'package:limetv/presentation/pages/filter_page/filter_page.dart';

class Routes {
  static const mainPage = '/mainPage';

  static const filterPage = '/filterPage';

  static const signPage = '/';
  static const signCodePage = '/signCodePage';
  static const landingPage = '/landingPage';
  static const tvPage = '/tvPage';
  static const settingsPage = '/settingsPage';
  static const tvVideoPlayerPage = '/tvVideoPlayerPage';
  static const myPage = '/myPage';

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

        case landingPage:
          return MaterialPageRoute(
            builder: (context) {
              return const LandingPage();
            },
          );
        case mainPage:
          return MaterialPageRoute(
            builder: (context) {
              return const MainPage();
            },
          );
        case myPage:
          return MaterialPageRoute(
            builder: (context) {
              return const MyPage();
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

        case tvVideoPlayerPage:
          return MaterialPageRoute(
            builder: (context) {
              return TvVideoPlayerPage(
                index: args?['index'],
                channelName: args?['channelName'],
              );
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
            builder: (_) => SignCodePage(number: args!['number']),
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



class MobileRoutes {
  static const mainPage = '/mainPage';

  static const filterPage = '/filterPage';

  static const signPage = '/';
  static const signCodePage = '/signCodePage';
  static const landingPage = '/landingPage';
  static const tvPage = '/tvPage';
  static const settingsPage = '/settingsPage';
  static const tvVideoPlayerPage = '/tvVideoPlayerPage';
  static const myPage = '/myPage';

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

        case landingPage:
          return MaterialPageRoute(
            builder: (context) {
              return const LandingPage();
            },
          );
        case mainPage:
          return MaterialPageRoute(
            builder: (context) {
              return const MobileMainPage();
            },
          );
        case myPage:
          return MaterialPageRoute(
            builder: (context) {
              return const MyPage();
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

        case tvVideoPlayerPage:
          return MaterialPageRoute(
            builder: (context) {
              return TvVideoPlayerPage(
                index: args?['index'],
                channelName: args?['channelName'],
              );
            },
          );

        case signPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const MobileSignPage(),
          );
        case signCodePage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => MobileSignCodePage(number: args!['number']),
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
