import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';
import '../../data/models/movie_model.dart';

class MovieBanner extends StatelessWidget {
  MovieBanner({
    Key? key,
    required this.model,
  }) : super(key: key);
  MovieModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1117.w,
      height: 888.h,
      padding: EdgeInsets.only(top: 63.h, right: 72.w),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(model.bgImage), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 228.w,
            height: 344.h,
            margin: EdgeInsets.only(bottom: 33.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              image: DecorationImage(image: AssetImage(model.mainImage), fit: BoxFit.cover),
            ),
          ),
          Text(model.name, style: AppTextStyles.head40w5),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 13.h),
            child: RichText(
              text: TextSpan(
                  text: model.rating,
                  style: AppTextStyles.body16w6.copyWith(color: AppColors.selectedColor),
                  children: [
                    TextSpan(
                      text: " | ",
                      style: AppTextStyles.body16w4.copyWith(color: AppColors.baseLight.shade20),
                    ),
                    TextSpan(
                      text: model.genre,
                      style: AppTextStyles.body16w4.copyWith(color: AppColors.baseLight.shade20),
                    ),
                  ]),
            ),
          ),
          Divider(
            thickness: 1.h,
            indent: 777.w,
            color: AppColors.baseLight.shade20,
          ),
          Container(
            width: 879.w,
            margin: EdgeInsets.only(top: 13.h, bottom: 39.h),
            child: Text(model.about,
                textAlign: TextAlign.end, style: AppTextStyles.body16w4.copyWith(color: AppColors.baseLight.shade40)),
          ),
          TextButton.icon(
            style: AppDecorations.buttonStyle(
              borderRadius: 32.r,
              bgColor: AppColors.selectedColor,
              padding: EdgeInsets.only(left: 45.w, right: 62.w, top: 22.h, bottom: 25.h),
            ),
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
            label: Text(
              "Cмотреть",
              style: AppTextStyles.body20w6,
            ),
          ),
        ],
      ),
    );
  }
}
