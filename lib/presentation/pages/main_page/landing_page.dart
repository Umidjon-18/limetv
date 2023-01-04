import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';

import '../../../config/constants/local_data.dart';
import '../../components/carousel_with_bottom_banner.dart';
import '../../components/category_grid.dart';
import '../../components/footer_component.dart';
import '../../components/genre_label.dart';
import '../../components/movie_banner.dart';
import '../../components/subscription_banner.dart';
import '../../components/web_appbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  ValueNotifier<int> currentRecommendIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: true,
              expandedHeight: 129.h,
              flexibleSpace: const WebAppBar(),
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 940.h,
                      autoPlay: true,
                      enlargeFactor: 0,
                      aspectRatio: 1728 / 1000,
                      disableCenter: true,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        currentIndex.value = index;
                      },
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    ),
                    items: List.generate(
                      bannerMovies.length,
                      (index) => MovieBanner(model: bannerMovies[index]),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 40.h,
                    child: ValueListenableBuilder(
                      builder: (context, value, child) {
                        return Wrap(
                          alignment: WrapAlignment.center,
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
                                color: currentIndex.value == index
                                    ? AppColors.selectedColor
                                    : AppColors.selectedColor.withOpacity(.3),
                              ),
                            ),
                          ),
                        );
                      },
                      valueListenable: currentIndex,
                    ),
                  )
                ],
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
                child: ListView.builder(
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
              ),
            ),
            SliverToBoxAdapter(
              child: GenreLabel(
                onTap: () {},
                margin: EdgeInsets.only(left: 72.w, bottom: 43.h, top: 70.h),
                title: "Скоро в кино",
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselSlider(
                options: MyCarouselOptions(
                  height: 485.h,
                  enlargeFactor: 0.15,
                  aspectRatio: 2 / 3,
                  viewportFraction: 0.23,
                ),
                items: List.generate(
                  skoroVKino.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                        image: AssetImage(skoroVKino[index].bgImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SubscriptionBanner(subscriptionMovies: subscriptionMovies),
            ),
            SliverToBoxAdapter(
              child: GenreLabel(
                onTap: () {},
                margin: EdgeInsets.only(left: 72.w, bottom: 43.h),
                title: "Фильмы",
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselSlider(
                options: MyCarouselOptions(),
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
            ),
            SliverToBoxAdapter(
              child: GenreLabel(
                onTap: () {},
                margin: EdgeInsets.only(left: 72.w, bottom: 43.h, top: 69.h),
                title: "Сериалы",
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselSlider(
                options: MyCarouselOptions(),
                items: List.generate(
                  serialy.length,
                  (index) => Container(
                    margin: EdgeInsets.only(right: 27.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                        image: AssetImage(serialy[index].bgImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GenreLabel(
                onTap: () {},
                margin: EdgeInsets.only(left: 72.w, bottom: 43.h, top: 69.h),
                title: "Категории",
              ),
            ),
            const SliverToBoxAdapter(
              child: CategoryGrid(),
            ),
            SliverToBoxAdapter(
              child: GenreLabel(
                onTap: () {},
                margin: EdgeInsets.only(left: 72.w, bottom: 43.h, top: 69.h),
                title: "Рекомендо",
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselWithBottomBanner(currentRecommendIndex: currentRecommendIndex),
            ),
            SliverToBoxAdapter(
              child: GenreLabel(
                onTap: () {},
                margin: EdgeInsets.only(left: 72.w, bottom: 43.h, top: 69.h),
                title: "Телеканалы",
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 295.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Assets.channelList.russianChannels.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 72.w, bottom: 69.h),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 224.h,
                      height: 224.h,
                      margin: EdgeInsets.only(right: 27.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColors.cardBgColor,
                      ),
                      child: Center(
                        child: Image.asset(Assets.channelList.russianChannels[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GenreLabel(
                onTap: () {},
                margin: EdgeInsets.only(left: 72.w, bottom: 43.h, top: 69.h),
                title: "Фильмы на Английском",
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 490.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: englishMovies.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 72.w),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 320.h,
                      height: 482.h,
                      margin: EdgeInsets.only(right: 27.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColors.cardBgColor,
                      ),
                      child: Center(
                        child: Image.asset(englishMovies[index].mainImage),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GenreLabel(
                onTap: () {},
                margin: EdgeInsets.only(left: 72.w, bottom: 43.h, top: 69.h),
                title: "Детям",
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 490.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: childrenCartoons.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 72.w, bottom: 185.h),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300.h,
                      height: 300.h,
                      margin: EdgeInsets.only(right: 27.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: Image.asset(childrenCartoons[index].mainImage),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: FooterComponent(),
            ),
          ],
        ));
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
