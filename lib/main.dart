import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return ScreenUtilInit(
          designSize: const Size(393, 852),
          splitScreenMode: true,
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: (settings) => MobileRoutes.generateRoute(settings),
              // home: SearchPage(),
            );
          });
    }
    return ScreenUtilInit(
        designSize: const Size(1728, 1117),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) => Routes.generateRoute(settings),
          );
        });
  }
}
