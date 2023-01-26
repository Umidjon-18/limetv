import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/config/constants/local_data.dart';
import 'package:limetv/presentation/components/footer_component.dart';

import '../../components/genre_label.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  ValueNotifier<int> currentRecommendIndex = ValueNotifier<int>(0);
  ScrollController controller = ScrollController();
  ScrollController resumeVideoController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: GenreLabel(
                onTap: () {},
                margin: EdgeInsets.only(left: 72.w, bottom: 43.h, top: 70.h),
                title: "Буду смотреть",
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 325.h,
                child: Stack(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      controller: controller,
                      itemCount: continueWatchingMovies.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 72.w),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 463.w,
                          height: 277.h,
                          margin: EdgeInsets.only(right: 27.w, bottom: 22.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            image: DecorationImage(
                              image: AssetImage(continueWatchingMovies[index].bgImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      right: 0,
                      child: ScrollVideosButton(controller: controller),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GenreLabel(
                onTap: () {},
                margin: EdgeInsets.only(left: 72.w, bottom: 43.h, top: 70.h),
                title: "Продолжить просмотр",
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 325.h,
                child: Stack(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      controller: resumeVideoController,
                      itemCount: continueWatchingMovies.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 72.w),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 463.w,
                              height: 277.h,
                              margin: EdgeInsets.only(right: 27.w, bottom: 22.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  image: AssetImage(continueWatchingMovies[index].bgImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(continueWatchingMovies[index].name, style: AppTextStyles.body20w6),
                          ],
                        );
                      },
                    ),
                    Positioned(
                      right: 0,
                      child: ScrollVideosButton(
                        controller: resumeVideoController,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 69.h),
                child: const FooterComponent(),
              ),
            ),
          ],
        ));
  }
}

class ScrollVideosButton extends StatelessWidget {
  const ScrollVideosButton({Key? key, required this.controller}) : super(key: key);
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 72.w, top: 145.h, bottom: 145.h),
      height: 331.h,
      width: 414.w,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff060A12).withOpacity(0),
            const Color(0xff060A12),
          ],
        ),
      ),
      child: Positioned(
        // right: 52.w,
        // top: 106.5.h,
        // bottom: 106.5.h,
        child: GestureDetector(
          onTap: () {
            controller.animateTo(controller.position.pixels + 500.w,
                duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
          },
          child: SvgPicture.asset(
            Assets.icons.play,
            color: AppColors.selectedColor.withOpacity(0.6),
            height: 64.h,
            width: 64.w,
          ),
        ),
      ),
    );
  }
}

class MyCarouselOptions extends CarouselOptions {
  MyCarouselOptions({
    double height = 280,
    double enlargeFactor = 0,
    double aspectRatio = 463 / 277,
    double viewportFraction = 0.28,
    dynamic Function(int, CarouselPageChangedReason)? onPageChanged,
  }) : super(
          height: height.h,
          autoPlay: true,
          enlargeFactor: enlargeFactor,
          aspectRatio: aspectRatio,
          disableCenter: true,
          viewportFraction: viewportFraction,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: onPageChanged,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
        );
}
