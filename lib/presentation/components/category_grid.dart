
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/local_data.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 72.w),
      child: GridView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 28,
          crossAxisSpacing: 28,
          childAspectRatio: 375 / 195,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 195.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.categoryBgColor.withOpacity(.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  categories[index].categoryIcon,
                  width: 82.h,
                  height: 82.h,
                ),
                SizedBox(width: 48.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(categories[index].categoryName, style: AppTextStyles.body20w5),
                    SizedBox(height: 2.h),
                    Text(
                      "(${categories[index].categoryMovieCount})",
                      style: AppTextStyles.body16w4.copyWith(color: AppColors.categoryCountColor),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
