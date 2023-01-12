import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/presentation/components/genre_label.dart';

class FilterResultTextWidget extends StatelessWidget {
  const FilterResultTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GenreLabel(onTap: () {}, title: 'Найдено 1924'),

        FiltersCategoryButtonWidget(
          onTap: () {},
          title: 'Фильмы',
          count: 1000,
        ),
        FiltersCategoryButtonWidget(
          onTap: () {},
          title: 'Сериалы',
          count: 900,
        ),
        FiltersCategoryButtonWidget(
          title: 'Мултьфильмы',
          count: 24,
          onTap: () {},
        ),

        // Row(
        //   children: List.generate(
        //     4,
        //     (index) => Padding(
        //       padding: EdgeInsets.only(left: 40.w),
        //       child: Text(
        //         'Фильмы (1000)',
        //         style: AppTextStyles.body22w5.copyWith(
        //             color: AppColors.selectedColor,
        //             decoration: TextDecoration.underline),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class FiltersCategoryButtonWidget extends StatelessWidget {
  const FiltersCategoryButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.count,
  });

  final VoidCallback onTap;
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          '$title ($count)',
          style: AppTextStyles.body22w5.copyWith(
              color: AppColors.selectedColor,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
