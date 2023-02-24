import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/assets.dart';
import '../../../../config/constants/local_data.dart';
import '../../../components/carousel_options.dart';

class FilmsChapter extends StatelessWidget {
  const FilmsChapter({
  super.key,
  required this.filmController,
  });

  final CarouselController filmController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: filmController,
          options: LandingCarouselOptions(
            height: 277,
          ),
          items: List.generate(
            filmy.length,
                (index) => Container(
              margin: EdgeInsets.only(right: 27.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  image: AssetImage(filmy[index].bgImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 410.w,
            height: 277.h,
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
        Positioned(
          right: 52.w,
          top: 106.5.h,
          bottom: 106.5.h,
          child: IconButton(
            onPressed: () {
              filmController.nextPage();
            },
            icon: SvgPicture.asset(
              Assets.icons.play,
              color: AppColors.selectedColor.withOpacity(0.6),
              height: 64.h,
              width: 64.w,
            ),
          ),
        ),
      ],
    );
  }
}
