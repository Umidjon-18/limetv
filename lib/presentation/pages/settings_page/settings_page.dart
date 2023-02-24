import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/constants.dart';
import '../../components/genre_label.dart';

import 'widget/child_protection_page.dart';
import 'widget/compl_and%20_sugg_page.dart';
import 'widget/my_devices_page.dart';
import 'widget/notification_page.dart';
import 'widget/settings_main.dart';
import 'widget/settings_menu_item.dart';
import 'widget/settings_payment_services.dart';

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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
           
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 69.h, left: 72.w, right: 76.w),
            decoration: BoxDecoration(
              color: AppColors.appBarBgColor,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenreLabel(
                    onTap: () {},
                    title: "Настройка",
                  ),
                  SizedBox(
                    height: 69.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(top: 162.h, left: 72.w),
              child: menus[onTap],
            ),
          )
        ],
      ),
    );
  }

  List menus = [
    const SettingsMainWidget(),
    const SettingsPaymentServices(),
    const MyDevicesPage(),
    const ChildProtectionPage(),
    const ComplaintsAndSuggestionPage(),
    const NotificationPage(),
    Text(
      'Выход',
      style: AppTextStyles.body37w5.copyWith(
        color: Colors.white,
      ),
    ),
  ];

  Color colorFunc(int index, int onTap) {
    if (onTap == index) {
      return const Color(0xff2F80ED);
    }
    if (index == 1) {
      return const Color(0xffF2994A);
    }
    return AppColors.settingsTextFieldAndTextColor;
  }
}
