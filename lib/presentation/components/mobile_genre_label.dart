import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';

class MobileGenreLabel extends StatelessWidget {
  const MobileGenreLabel({
    Key? key,
    required this.onTap,
    this.topMargin,
    required this.title,
    this.subtitle ,
    this.subtitleColor ,
  }) : super(key: key);

  final Function() onTap;
  final double? topMargin;
  final String title;
  final String? subtitle;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.w, bottom: 12.h, top: topMargin ?? 28.h,right: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.body14w5),
          GestureDetector(
            onTap: onTap,
            child: Text(
              subtitle ?? "Все",
              style: AppTextStyles.body12w4.copyWith(
                color: subtitleColor ?? AppColors.selectedColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
