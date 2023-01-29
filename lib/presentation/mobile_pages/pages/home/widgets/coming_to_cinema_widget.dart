import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/data/models/movie_model.dart';
import 'package:limetv/presentation/components/carousel_options.dart';

class FilmsCardSlider extends StatelessWidget {
  const FilmsCardSlider({
    super.key,
    required this.controller,
    required this.sliderHeight,
    this.isHaveBorder = false,
    this.autoPlay = true,
    required this.data,
  });

  final double sliderHeight;
  final List<MovieModel> data;
  final bool isHaveBorder;
  final bool autoPlay;
  final CarouselController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarouselSlider(
          carouselController: controller,
          options: LandingCarouselOptions(height: sliderHeight, autoPlay: autoPlay),
          items: List.generate(
            data.length,
            (index) {
              return ComingSoonToCinemaWidget(
                model: data[index],
                haveBorder: isHaveBorder,
              );
            },
          ),
        ),
        Positioned(
          right: 0,
          top: isHaveBorder ? -2 : -1,
          child: Container(
            width: 124.w,
            height: sliderHeight.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xff060A12).withOpacity(0),
                  const Color(0xff060A12),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ComingSoonToCinemaWidget extends StatelessWidget {
  const ComingSoonToCinemaWidget({super.key, required this.model, required this.haveBorder});

  final MovieModel model;
  final bool haveBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: haveBorder ? null : 141.h,
          width: 97.w,
          margin: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: haveBorder
                ? Border.all(
                    color: AppColors.selectedColor,
                    width: 2.w,
                    strokeAlign: StrokeAlign.outside,
                  )
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.asset(
              model.bgImage,
              fit: BoxFit.cover,
              height: 145.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.w, top: 8.h),
          child: AutoSizeText(
            model.name,
            style: AppTextStyles.body12w5.copyWith(color: AppColors.whiteF2),
            overflow: TextOverflow.ellipsis,
            minFontSize: 6,
            maxLines: 2,
          ),
        ),
        if (!haveBorder)
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 2.h),
            child: AutoSizeText(
              model.genre.substring(0, 10),

              ///TODO clear substring
              style: AppTextStyles.body10w4.copyWith(color: AppColors.settingsTextFieldAndTextColor),
              minFontSize: 6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}
//   Positioned(
//               bottom: 29.h,
//               left: 47.w,
//               right: 47.w,
//               child: AnimatedOpacity(
//                 opacity:  1 : 0,
//                 duration: const Duration(milliseconds: 200),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AutoSizeText(
//                       '${skoroVKino[index].name} (${skoroVKino[index].date})',
//                       style: AppTextStyles.body26w5
//                           .copyWith(fontWeight: FontWeight.w700),
//                       minFontSize: 6,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 4.h),
//                     AutoSizeText(
//                       skoroVKino[index].genre,
//                       style: AppTextStyles.body12w4.copyWith(
//                           color: AppColors.selectedColor,
//                           decoration: TextDecoration.underline),
//                       minFontSize: 6,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
