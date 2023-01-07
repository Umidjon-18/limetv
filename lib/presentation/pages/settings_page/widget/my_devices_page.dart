import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/presentation/pages/settings_page/widget/child_protection_page.dart';
import 'package:limetv/presentation/pages/settings_page/widget/custom_button.dart';

class MyDevicesPage extends StatelessWidget {
  const MyDevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Мои устройства', style: AppTextStyles.body18w5),
        Padding(
          padding: EdgeInsets.only(top: 18.h, bottom: 32.h),
          child: Text(
            'К учётной записи в LIMETV можно подключить до пяти устройств.\nНачните просмотр на одном устройстве и продолжите на другом.',
            style:
                AppTextStyles.body16w4.copyWith(color: AppColors.borderColor),
          ),
        ),
        const CustomButton(
            text: 'Добавить', buttonColor: AppColors.selectedColor),
        Padding(
          padding: EdgeInsets.only(top: 32.h, bottom: 43.h),
          child: Text(
              'Или загрузите приложение “LIMETV” для смартфона и планшета.',
              style: AppTextStyles.body16w4
                  .copyWith(color: AppColors.borderColor)),
        ),
        RichText(
          text: TextSpan(
              text: 'Доступно на',
              style:
                  AppTextStyles.body16w4.copyWith(color: AppColors.borderColor),
              children: [
                TextSpan(
                  text: ' IOS ',
                  style: AppTextStyles.body16w4
                      .copyWith(color: AppColors.categoryCountColor),
                ),
                TextSpan(
                  text: ", ",
                  style: AppTextStyles.body16w4
                      .copyWith(color: AppColors.borderColor),
                ),
                TextSpan(
                  text: 'Android',
                  style: AppTextStyles.body16w4
                      .copyWith(color: AppColors.categoryCountColor),
                )
              ]),
        ),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 21.h),
                  child: SvgPicture.asset(Assets.icons.ios),
                ),
                Image.asset(Assets.images.crcode)
              ],
            ),
            SizedBox(width: 70.w),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 21.h),
                  child: SvgPicture.asset(Assets.icons.android),
                ),
                Image.asset(Assets.images.crcode)
              ],
            )
          ],
        )
      ],
    );
  }
}
