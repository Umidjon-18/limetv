
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';
import '../../config/constants/local_data.dart';

class CarouselWithBottomBanner extends StatelessWidget {
  const CarouselWithBottomBanner({
    Key? key,
    required this.currentRecommendIndex,
  }) : super(key: key);

  final ValueNotifier<int> currentRecommendIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 350.h,
            initialPage: 0,
            reverse: false,
            autoPlay: true,
            enlargeFactor: 0.4,
            aspectRatio: 16 / 9,
            disableCenter: true,
            viewportFraction: 0.31,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              currentRecommendIndex.value = index;
            },
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
          ),
          items: List.generate(
            filmy.length,
            (index) {
              return ValueListenableBuilder(
                builder: (context, i, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 463.w,
                        height: 277.h,
                        margin: EdgeInsets.only(right: 27.w, bottom: 22.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: index == currentRecommendIndex.value
                              ? Border.all(width: 2, color: AppColors.selectedColor)
                              : null,
                          image: DecorationImage(
                            image: AssetImage(filmy[index].bgImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (index == currentRecommendIndex.value)
                        Transform.translate(
                          offset: Offset(0, -23.h),
                          child: SvgPicture.asset(Assets.icons.arrowDown),
                        ),
                    ],
                  );
                },
                valueListenable: currentRecommendIndex,
              );
            },
          ),
        ),
        ValueListenableBuilder(
          builder: (context, index, child) {
            return Container(
              height: 737.h,
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 72.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(width: 2.h, color: AppColors.selectedColor),
                image: DecorationImage(
                  image: AssetImage(filmy[currentRecommendIndex.value].bgImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      gradient: LinearGradient(colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(.65),
                        Colors.black.withOpacity(.83),
                        Colors.black.withOpacity(1),
                      ]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 36.h,
                      height: 36.h,
                      padding: EdgeInsets.all(10.h),
                      margin: EdgeInsets.only(top: 23.h, right: 21.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.selectedColor.withOpacity(.1),
                      ),
                      child: SvgPicture.asset(Assets.icons.cancel),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: 50.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: AppDecorations.buttonStyle(
                            bgColor: AppColors.selectedColor,
                            padding: EdgeInsets.symmetric(horizontal: 48.h, vertical: 25.h),
                            borderRadius: 32.r,
                          ),
                          child: Text(
                            "О филме",
                            style: AppTextStyles.body20w5,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        TextButton(
                          onPressed: () {},
                          style: AppDecorations.buttonStyle(
                            bgColor: Colors.transparent,
                            border: const BorderSide(width: 1, color: AppColors.selectedColor),
                            padding: EdgeInsets.symmetric(horizontal: 57.h, vertical: 25.h),
                            borderRadius: 32.r,
                          ),
                          child: Text(
                            "Детали",
                            style: AppTextStyles.body20w5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 209.h, right: 72.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(filmy[currentRecommendIndex.value].name, style: AppTextStyles.head84w7),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          child: RichText(
                            text: TextSpan(
                                text: filmy[currentRecommendIndex.value].rating,
                                style: AppTextStyles.body16w6.copyWith(color: AppColors.selectedColor),
                                children: [
                                  TextSpan(
                                    text: " | ",
                                    style:
                                        AppTextStyles.body16w4.copyWith(color: AppColors.baseLight.shade20),
                                  ),
                                  TextSpan(
                                    text: filmy[currentRecommendIndex.value].genre,
                                    style:
                                        AppTextStyles.body16w4.copyWith(color: AppColors.baseLight.shade20),
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
                          child: Text(filmy[currentRecommendIndex.value].about,
                              textAlign: TextAlign.end,
                              style: AppTextStyles.body16w4.copyWith(color: AppColors.baseLight.shade40)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: AppDecorations.buttonStyle(
                                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 30.w),
                                border: BorderSide(color: AppColors.selectedColor, width: 1.h),
                                borderRadius: 32.r,
                                bgColor: Colors.transparent,
                              ),
                              onPressed: () {},
                              child: const Icon(Icons.more_horiz, color: AppColors.selectedColor),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.w),
                              child: TextButton(
                                style: AppDecorations.buttonStyle(
                                  padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 30.w),
                                  border: BorderSide(color: AppColors.selectedColor, width: 1.h),
                                  borderRadius: 32.r,
                                  bgColor: Colors.transparent,
                                ),
                                onPressed: () {},
                                child: SvgPicture.asset(Assets.icons.favoriteColored),
                              ),
                            ),
                            TextButton.icon(
                              style: AppDecorations.buttonStyle(
                                borderRadius: 32.r,
                                bgColor: AppColors.selectedColor,
                                padding: EdgeInsets.only(left: 45.w, right: 62.w, top: 22.h, bottom: 25.h),
                              ),
                              onPressed: () {},
                              icon: Text(
                                "Cмотреть",
                                style: AppTextStyles.body20w6,
                              ),
                              label: Icon(Icons.play_arrow, color: AppColors.baseLight.shade100),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          valueListenable: currentRecommendIndex,
        ),
      ],
    );
  }
}
