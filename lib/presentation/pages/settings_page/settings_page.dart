import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/presentation/components/genre_label.dart';
import 'package:limetv/presentation/components/web_appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int onTap = 0;

  List<String> settingsMenuName = [
    'Основные',
    'Оплата услуг',
    'Мои утсройства',
    'Защита от детей',
    'Жалобы и предложения',
    'Уведомление',
    'Выход',
  ];

  List<String> settingIconText = [
    Assets.icons.settingsMain,
    Assets.icons.paymentServices,
    Assets.icons.myDevices,
    Assets.icons.securityChilds,
    Assets.icons.complaintsSuggestions,
    Assets.icons.notifications,
    Assets.icons.exit,
  ];

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



class SettingsMenuItem extends StatelessWidget {
  SettingsMenuItem({
    required this.text,
    required this.color,
    required this.assetsIconText,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  String text;
  String assetsIconText;
  Color color;
  bool onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          onClick ? SvgPicture.asset(
            Assets.icons.point,
            color: color,
          ) : SvgPicture.asset(
            Assets.icons.point,
            color: Colors.transparent,
          ) ,
          Row(
            children: [
              SizedBox(
                width: 17.3.w,
              ),
              SvgPicture.asset(
                assetsIconText,
                color: color,
              ),
              SizedBox(
                width: 17.3.w,
              ),
              Text(
                text,
                style: AppTextStyles.body18w5.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
