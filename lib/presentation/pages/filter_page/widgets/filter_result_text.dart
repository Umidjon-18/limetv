import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';

class FilterResultTextWidget extends StatelessWidget {
  const FilterResultTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text('Найдено 1924', style: AppTextStyles.body22w7),
            const Icon(Icons.arrow_right,
                color: AppColors.accentColor, size: 12)
          ],
        ),
        Row(
          children: List.generate(
            4,
            (index) => Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: Text(
                'Фильмы (1000)',
                style: AppTextStyles.body22w5.copyWith(
                    color: AppColors.selectedColor,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
