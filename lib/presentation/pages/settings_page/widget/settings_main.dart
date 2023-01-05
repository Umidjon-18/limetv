import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/config/constants/local_data.dart';

class SettingsMainWidget extends StatelessWidget {
  const SettingsMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          settingsMainWidgetText,
          style: AppTextStyles.body18w5,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 28.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 140.h,
                height: 140.h,
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.h, color: AppColors.personContainerColor),
                ),
                child: Container(
                  width: 129.36.h,
                  height: 129.36.h,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.personContainerColor,
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.person,
                    width: 101.6.w,
                    height: 103.9.h,
                  ),
                ),
              ),
              SizedBox(
                width: 476.h,
                height: 344.h,
                child: Column(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
