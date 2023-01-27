import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/local_data.dart';

class CategoryMobileGridView extends StatelessWidget {
  const CategoryMobileGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 14.w,
          crossAxisSpacing: 14.w,
          childAspectRatio: 105 / 104,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 104.w,
            width: 105.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.categoryBgColor.withOpacity(.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  categories[index].categoryIcon,
                  width: 35.w,
                  height: 31.5.h,
                ),
                SizedBox(height: 13.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(categories[index].categoryName, style: AppTextStyles.body10w5),
                    SizedBox(height: 3.h),
                    Text(
                      "(${categories[index].categoryMovieCount})",
                      style: AppTextStyles.body10w4.copyWith(color: AppColors.categoryCountColor),
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
