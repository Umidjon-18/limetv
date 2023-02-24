import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/constants/app_text_styles.dart';

import '../../../../config/constants/app_colors.dart';

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
        color: buttonColor == null ? Colors.transparent : AppColors.selectedColor,
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
