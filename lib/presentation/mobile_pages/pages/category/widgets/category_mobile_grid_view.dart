import 'package:auto_size_text/auto_size_text.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 14.h,
          crossAxisSpacing: 14.w,
          // childAspectRatio: 105 / 104,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){},
            child: Container(
              height: 104.w,
              width: 105.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.containerColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    categories[index].categoryIcon,
                    width: 42.w,
                    height: 42.h,
                  ),
                  SizedBox(height: 8.h),
                  AutoSizeText(
                    categories[index].categoryName,
                    style: AppTextStyles.body10w5,
                    maxLines: 1,
                    minFontSize: 6,
                  ),
                  SizedBox(height: 3.h),
                  AutoSizeText(
                    "(${categories[index].categoryMovieCount})",
                    style: AppTextStyles.body10w4
                        .copyWith(color: AppColors.categoryCountColor),
                    minFontSize: 6,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
