import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.text,
    required this.checked,
  }) : super(key: key);
  final String text;
  final bool checked;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44.r),
          border: Border.all(
            color: checked ? AppColors.selectedColor : AppColors.borderColor,
          ),
        ),
        height: 60.h,
        child: checked
            ? TextButton.icon(
                onPressed: null,
                icon: const Icon(
                  Icons.check,
                  color: AppColors.selectedColor,
                  size: 16,
                ),
                label: Text(text,
                    style: AppTextStyles.body16w4
                        .copyWith(color: AppColors.selectedColor)))
            : Text(
                text,
                style: AppTextStyles.body16w4,
              )
        );
  }
}
