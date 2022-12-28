import 'package:flutter/material.dart';

import '../pages/main_page/main_page.dart';

class Routes {
  static const welcomePage = '/';
  static const signWelcomePage = '/signWelcomePage';
  static const favoritePage = '/favoritePage';
  static const addStocks = '/addStocks';
  static const signInPage = '/signInPage';
  static const signInTwitter = '/signInTwitter';
  static const changePassword = '/changePassword';

  static const restoreNumberPage = '/mainPagerestoreNumberPage';
  static const restoreActivationCode = '/restoreActivationCode';
  static const restoreSetUpPinCodePage = '/restoreSetUpPinCodePage';

  static const signUpNumberPage = '/signUpNumberPage';
  static const signUpActivCodePage = '/signUpActivCodePage';
  static const signUpPinCodePage = '/signUpPinCodePage';
  static const enterUserInfoPage = '/enterUserIngoPage';

  static const mainPage = '/mainPage';
  static const newsPage = '/newsPage';
  static const walletPage = '/walletPage';
  static const settingsPage = '/settingsPage';
  static const walletConnectPage = '/walletConnectPage';
  static const priceAlertsPage = '/priceAlertsPage';
  static const pushNotificationPage = '/pushNotificationPage';
  static const securityPage = '/securityPage';
  static const subscriptionPage = '/subscriptionPage';
  static const aboutPage = '/aboutPage';
  static const stocksPage = '/stocksPage';
  static const searchPage = '/searchPage';
  static const swipePage = '/swipePage';
  static const notificationsPage = '/notificationsPage';
  static const lastSwaps = '/lastSwaps';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic>? args = routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        
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
