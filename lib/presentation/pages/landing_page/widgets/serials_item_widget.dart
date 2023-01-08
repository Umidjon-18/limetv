import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/presentation/components/carousel_options.dart';

import '../../../../config/constants/local_data.dart';

class SerialsChapter extends StatelessWidget {
  const SerialsChapter({
    super.key,
    required this.serialController,
    required this.serialIndex,
  });

  final CarouselController serialController;
  final ValueNotifier<int> serialIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarouselSlider(
          carouselController: serialController,
          options: LandingCarouselOptions(
            height: 346,
            viewportFraction: 0.33,
            enlargeFactor: 0.3,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            onPageChanged: (index, p1) {
              serialIndex.value = index;
            },
          ),
          items: List.generate(
            serialy.length,
            (index) => SerialsItemWidget(
              serialsItemIndex: serialIndex,
              index: index,
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
          top: 106.h,
          bottom: 106.h,
          child: IconButton(
            onPressed: () {
              serialController.nextPage();
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

class SerialsItemWidget extends StatelessWidget {
  const SerialsItemWidget({
    super.key,
    required this.serialsItemIndex,
    required this.index,
  });

  final ValueNotifier<int> serialsItemIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, i, child) {
        bool isActive = index == serialsItemIndex.value;
        return Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Container(
              margin: EdgeInsets.only(right: 27.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: isActive
                    ? [
                        const BoxShadow(
                            color: Color(0xff122345), blurRadius: 250)
                      ]
                    : null,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                decoration: isActive
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
                    serialy[index].bgImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (isActive)
              Container(
                margin: EdgeInsets.only(right: 27.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black,
                        ])),
              ),
            Positioned(
              left: -9.w,
              top: 15.79.h,
              child: AnimatedOpacity(
                opacity: isActive ? 1 : 0,
                duration: const Duration(milliseconds: 200),

                child: Column(
                  children: [
                    Container(
                      width: 54.w,
                      color: AppColors.selectedColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.w, vertical: 8.h),
                      child: Column(
                        children: [
                          AutoSizeText(
                            '9.9',
                            style: AppTextStyles.body22w5,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            minFontSize: 6,
                          ),
                          AutoSizeText(
                            'IMDB',
                            style: AppTextStyles.body10w6
                                .copyWith(fontWeight: FontWeight.w700),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            minFontSize: 6,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 54.w,
                      color: AppColors.selectedColor,
                      margin: EdgeInsets.only(top: 13.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.w, vertical: 8.h),
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                        children: [
                          AutoSizeText(
                            '8.7',
                            style: AppTextStyles.body22w5,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            minFontSize: 6,
                          ),
                          AutoSizeText(
                            'KP',
                            style: AppTextStyles.body10w6
                                .copyWith(fontWeight: FontWeight.w700),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            minFontSize: 6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 41.h,
              left: 31.w,
              right: 31.w,
              child: AnimatedOpacity(
                opacity: isActive ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '${serialy[index].name} (${serialy[index].date})',
                      style: AppTextStyles.body26w5
                          .copyWith(fontWeight: FontWeight.w700),
                      minFontSize: 6,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    AutoSizeText(
                      serialy[index].genre,
                      style: AppTextStyles.body12w4.copyWith(
                          color: AppColors.selectedColor,
                          decoration: TextDecoration.underline),
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
      valueListenable: serialsItemIndex,
    );
  }
}
