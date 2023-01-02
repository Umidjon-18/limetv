
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/local_data.dart';
import 'movie_banner.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController pageController = PageController();
  late Timer timer;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    // TODO remove comments for using carousel
    // timer = Timer.periodic(
    //   const Duration(milliseconds: 2500),
    //   (timer) {
    //     if (currentIndex != 3) {
    //       pageController.nextPage(duration: const Duration(milliseconds: 800), curve: Curves.easeIn);
    //     } else {
    //       pageController.jumpToPage(0);
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          children: [
            MovieBanner(model: bannerMovies[0]),
            MovieBanner(model: bannerMovies[1]),
            MovieBanner(model: bannerMovies[2]),
            MovieBanner(model: bannerMovies[3]),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: List.generate(
              4,
              (index) => Container(
                width: 12.h,
                height: 12.h,
                margin: EdgeInsets.only(bottom: 40.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? AppColors.selectedColor : AppColors.selectedColor.withOpacity(.3),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
