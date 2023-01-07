import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: CustomScrollView(
          slivers: <Widget>[
            // SliverAppBar(
            //   pinned: false,
            //   snap: false,
            //   floating: true,
            //   expandedHeight: 129.h,
            //   flexibleSpace: const WebAppBar(),
            // ),
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
                              margin:
                                  EdgeInsets.only(right: 27.w, bottom: 22.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  image: AssetImage(
                                      continueWatchingMovies[index].bgImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: ScrollVideosButton(),
                    )
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
                              margin:
                                  EdgeInsets.only(right: 27.w, bottom: 22.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  image: AssetImage(
                                      continueWatchingMovies[index].bgImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(continueWatchingMovies[index].name,
                                style: AppTextStyles.body20w6),
                          ],
                        );
                      },
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: ScrollVideosButton(),
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
  const ScrollVideosButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 93.w),
      alignment: Alignment.centerRight,
      height: 331.h,
      width: 414.w,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color(0xff060A12).withOpacity(0.345),
        const Color.fromARGB(0, 6, 10, 18).withOpacity(0.9665)
      ])),
      child: const Icon(
        Icons.arrow_right_sharp,
        color: AppColors.selectedColor,
        size: 50,
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
