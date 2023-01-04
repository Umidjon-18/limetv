import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/presentation/components/genre_label.dart';
import 'package:limetv/presentation/components/web_appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const WebAppBar(),
      body: Row(
        children: [
          Container(
            width: 450.w,
            padding: EdgeInsets.only(top: 69.h, left: 72.w),
            child: Column(
              children: [
                GenreLabel(onTap: () {}, title: "Настройка"),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
