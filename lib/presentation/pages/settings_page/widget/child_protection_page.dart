import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';

import 'custom_button.dart';

class ChildProtectionPage extends StatelessWidget {
  const ChildProtectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Придумайте и запомните PIN-код из цифр',
          style: AppTextStyles.body18w5,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 18.h),
          child: Text(
            'Но если вдруг забудете, то мы просто напомним его в SMS',
            style:
                AppTextStyles.body16w4.copyWith(color: AppColors.borderColor),
          ),
        ),
        Row(
          children: List.generate(
            4,
            (index) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 4.w),
              width: 36.w,
              height: 62.h,
              decoration: BoxDecoration(
                  color: AppColors.appBarBgColor,
                  borderRadius: BorderRadius.circular(18)),
              child: Text(
                '*',
                style: AppTextStyles.body18w5,
              ),
            ),
          ),
        ),
        SizedBox(height: 28.h),
        Row(
          children: const [
            CustomButton(
              text: 'Продолжить',
              buttonColor: AppColors.selectedColor,
            ),
            SizedBox(
              width: 28,
            ),
            CustomButton(
              text: 'Отмена',
            ),
          ],
        ),
      ],
    );
  }
}
