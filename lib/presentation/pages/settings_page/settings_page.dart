import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/constants.dart';
import 'package:limetv/presentation/components/genre_label.dart';
import 'package:limetv/presentation/components/web_appbar.dart';
import 'package:limetv/presentation/pages/settings_page/widget/settings_menu_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int onTap = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const WebAppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 450.w,
            padding: EdgeInsets.only(top: 69.h, left: 72.w),
            decoration: BoxDecoration(
              color: AppColors.appBarBgColor,
            ),
            child: Column(
              children: [
                GenreLabel(
                  onTap: () {},
                  title: "Настройка",
                ),
                SizedBox(
                  height: 69.h,
                ),
                Column(
                  children: List.generate(
                    settingsMenuName.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            onTap = index;
                          });
                        },
                        child: SettingsMenuItem(
                          text: settingsMenuName[index],
                          color: colorFunc(index, onTap),
                          assetsIconText: settingIconText[index],
                          onClick: index == onTap,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 162.h, left: 72.w),
            child: Text(
              settingsMenuName[onTap],
              style: AppTextStyles.body37w5.copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Color colorFunc(int index, int onTap) {
  if (onTap == index) {
    return const Color(0xff2F80ED);
  }
  if (index == 1) {
    return const Color(0xffF2994A);
  }
  return const Color(0xff828282);
}
