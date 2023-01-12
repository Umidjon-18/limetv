import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';

class GenreLabel extends StatelessWidget {
  const GenreLabel({
    Key? key,
    required this.onTap,
    this.margin,
    required this.title,
  }) : super(key: key);

  final Function() onTap;
  final EdgeInsets? margin;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        child: Row(
          children: [
            Text(title, style: AppTextStyles.body22w7),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              Assets.icons.arrowRight,
              color: AppColors.baseLight.shade100,width: 24.w,height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
