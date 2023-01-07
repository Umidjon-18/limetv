import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';

class RubricsButton extends StatelessWidget {
  const RubricsButton({
    Key? key,
    required this.selected,
    required this.name,
  }) : super(key: key);

  final bool selected;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: AppTextStyles.body22w7,
        ),
        SizedBox(width: 10.w),
        selected
            ? const Icon(
                Icons.add,
                color: AppColors.accentColor,
                size: 14,
              )
            : Icon(
                Icons.close,
                color: AppColors.accentColor,
                size: 18.h,
              ),
      ],
    );
  }
}
