import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';

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

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.buttonColor,
  }) : super(key: key);

  final String text;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 21.h),
      decoration: BoxDecoration(
        color:
            buttonColor == null ? Colors.transparent : AppColors.selectedColor,
        borderRadius: BorderRadius.circular(32.r),
        border: buttonColor != AppColors.selectedColor
            ? Border.all(
                width: 1.h,
                color: AppColors.selectedColor,
              )
            : null,
      ),
      child: Text(
        text,
        style: AppTextStyles.body18w4,
      ),
    );
  }
}
