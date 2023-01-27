import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/config/constants/local_data.dart';
import 'package:limetv/presentation/components/carousel_options.dart';

class ComingToCinemaChapter extends StatelessWidget {
  const ComingToCinemaChapter({
    super.key,
    required this.comingSoonToCinemaController,
    required this.comingSoonToCinemaIndex,
  });

  final CarouselController comingSoonToCinemaController;
  final ValueNotifier<int> comingSoonToCinemaIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarouselSlider(
          carouselController: comingSoonToCinemaController,
          options: LandingCarouselOptions(
            height: 546,
            enlargeFactor: 0.15,
            aspectRatio: 2 / 3,
            viewportFraction: 0.23,
            onPageChanged: (index, p1) {
              comingSoonToCinemaIndex.value = index;
            },
          ),
          items: List.generate(
            skoroVKino.length,
            (index) {
              return ComingSoonToCinemaWidget(
                comingSoonToCinemaIndex: comingSoonToCinemaIndex,
                index: index,
              );
            },
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 410.w,
            height: 489.h,
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
          top: 241.h,
          bottom: 241.h,
          child: IconButton(
            onPressed: () {
              comingSoonToCinemaController.nextPage();
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

class ComingSoonToCinemaWidget extends StatelessWidget {
  const ComingSoonToCinemaWidget({
    super.key,
    required this.comingSoonToCinemaIndex,
    required this.index,
  });

  final ValueNotifier<int> comingSoonToCinemaIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, i, child) {
        bool isActive = index == comingSoonToCinemaIndex.value;
        return Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(horizontal: isActive ? 12.w : 20.w, vertical: isActive ? 0 : 31.h),
              decoration: BoxDecoration(
                boxShadow: isActive ? [const BoxShadow(color: Color(0xff122345), blurRadius: 250)] : null,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                decoration: index == comingSoonToCinemaIndex.value
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.selectedColor,
                            AppColors.selectedColor.withOpacity(0),
                          ],
                        ),
                      )
                    : null,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset(
                    skoroVKino[index].bgImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 29.h,
              left: 47.w,
              right: 47.w,
              child: AnimatedOpacity(
                opacity: isActive ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '${skoroVKino[index].name} (${skoroVKino[index].date})',
                      style: AppTextStyles.body26w5.copyWith(fontWeight: FontWeight.w700),
                      minFontSize: 6,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    AutoSizeText(
                      skoroVKino[index].genre,
                      style: AppTextStyles.body12w4
                          .copyWith(color: AppColors.selectedColor, decoration: TextDecoration.underline),
                      minFontSize: 6,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      valueListenable: comingSoonToCinemaIndex,
    );
  }
}
