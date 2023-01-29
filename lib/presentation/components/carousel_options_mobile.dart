import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingCarouselOptionsMobile extends CarouselOptions {
  LandingCarouselOptionsMobile({
    double height = 197,
    double enlargeFactor = 0,
    double aspectRatio = 96 / 197,
    bool enlargeCenterPage = false,
    double viewportFraction = 0.28,
    bool autoPlay = true,
    dynamic Function(int, CarouselPageChangedReason)? onPageChanged,
  }) : super(
          height: height.h,
          enlargeCenterPage: enlargeCenterPage,
          autoPlay: autoPlay,
          enlargeFactor: enlargeFactor,
          aspectRatio: aspectRatio,
          disableCenter: true,
          viewportFraction: viewportFraction,
          clipBehavior: Clip.none,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: onPageChanged,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
        );
}
