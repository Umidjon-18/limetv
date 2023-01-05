import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/presentation/pages/tv_page/tv_page.dart';
import 'package:limetv/presentation/pages/tv_page/tv_video_player_page.dart';

import 'presentation/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1728, 1117),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            // onGenerateRoute: (settings) => Routes.generateRoute(settings),
            home: TVPage(),
          );
        });
  }
}
