import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';

class CustomButtonMobile extends StatelessWidget {
  const CustomButtonMobile({
    Key? key,
    required this.text,
    this.buttonColor,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String text;
  final Color? buttonColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
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
        style: AppTextStyles.body12w5,
      ),
    );
  }
}
