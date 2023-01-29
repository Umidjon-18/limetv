import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/config/constants/local_data.dart';
import 'package:limetv/presentation/components/mobile_genre_label.dart';
import 'package:limetv/presentation/mobile_pages/pages/home/widgets/mob_movie_banner.dart';
import 'widgets/coming_to_cinema_widget.dart';
import 'widgets/subscription_banner.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  ValueNotifier<int> comingSoonToCinemaIndex = ValueNotifier<int>(0);
  ValueNotifier<int> serialIndex = ValueNotifier<int>(0);
  ValueNotifier<int> currentRecommendIndex = ValueNotifier<int>(0);
  CarouselController comingSoonToCinemaController = CarouselController();
  CarouselController serialController = CarouselController();
  CarouselController filmController = CarouselController();
  CarouselController recommendedController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(114.h),
          child: Container(
            height: 114.h,
            color: AppColors.backgroundColor,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 27.h),
            child: GestureDetector(
                onTap: () {
                  // select(0);
                },
                child: SvgPicture.asset(Assets.images.logo)),
          ),
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 146.h,
                      autoPlay: true,
                      enlargeFactor: 0,
                      // aspectRatio: 1728 / 1000,
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
                      (index) => MobileMovieBanner(model: bannerMovies[index]),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: MobileGenreLabel(
                onTap: () {},
                title: "Продолжить просмотр",
              ),
            ),
            const SliverToBoxAdapter(
              child: ContinueBrowsingChapter(),
            ),
            SliverToBoxAdapter(
              child: MobileGenreLabel(
                onTap: () {},
                title: "Скоро в кино",
              ),
            ),
            SliverToBoxAdapter(
              child: FilmsCardSlider(
                controller: comingSoonToCinemaController,
                data: skoroVKino,
                isHaveBorder: true,
                sliderHeight: 185,
              ),
            ),
            SliverToBoxAdapter(
              child: MobileGenreLabel(
                onTap: () {},
                topMargin: 24.h,
                title: "Фильмы",
              ),
            ),
            SliverToBoxAdapter(
              child: FilmsCardSlider(
                controller: filmController,
                data: filmy,
                sliderHeight: 198,
              ),
            ),
            SliverToBoxAdapter(
              child: MobileGenreLabel(
                onTap: () {},
                topMargin: 24.h,
                title: "Сериалы",
              ),
            ),
            SliverToBoxAdapter(
              child: FilmsCardSlider(
                controller: serialController,
                data: serialy,
                sliderHeight: 198,
              ),
            ),
            SliverToBoxAdapter(
              child: SubscriptionBannerInMobile(subscriptionMovies: subscriptionMovies),
            ),

            SliverToBoxAdapter(
              child: MobileGenreLabel(
                onTap: () {},
                topMargin: 24.h,
                title: "Телеканалы",
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 95.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: Assets.channelList.russianChannels.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 24.w),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 95.7.h,
                      height: 95.28.h,
                      padding: EdgeInsets.symmetric(horizontal: 11.5.w),
                      margin: EdgeInsets.only(right: 12.w),
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
              child: MobileGenreLabel(
                onTap: () {},
                topMargin: 24.h,
                title: "Рекомендуем",
              ),
            ),
            SliverToBoxAdapter(
              child: FilmsCardSlider(
                controller: recommendedController,
                data: filmy,
                sliderHeight: 198,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 110.h,
              ),
            ),
            // SliverToBoxAdapter(
            //   child: MobileGenreLabel(
            //     onTap: () {},
            //     title: "Категории",
            //   ),
            // ),
            // const SliverToBoxAdapter(
            //   child: CategoryGrid(),
            // ),
            // SliverToBoxAdapter(
            //   child: MobileGenreLabel(
            //     onTap: () {},
            //     topMargin: 24.h,
            //     title: "Рекомендо",
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: CarouselWithBottomBanner(
            //       currentRecommendIndex: currentRecommendIndex),
            // ),
            // SliverToBoxAdapter(
            //   child: MobileGenreLabel(
            //     onTap: () {},
            //     topMargin: 24.h,
            //     title: "Фильмы на Английском",
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 490.h,
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: englishMovies.length,
            //       scrollDirection: Axis.horizontal,
            //       padding: EdgeInsets.only(left: 72.w),
            //       itemBuilder: (context, index) {
            //         return Container(
            //           width: 320.h,
            //           height: 482.h,
            //           margin: EdgeInsets.only(right: 27.w),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(15.r),
            //             color: AppColors.cardBgColor,
            //           ),
            //           child: Center(
            //             child: Image.asset(englishMovies[index].mainImage),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: MobileGenreLabel(
            //     onTap: () {},
            //     topMargin: 24.h,
            //     title: "Детям",
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 490.h,
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: childrenCartoons.length,
            //       scrollDirection: Axis.horizontal,
            //       padding: EdgeInsets.only(left: 72.w, bottom: 185.h),
            //       itemBuilder: (context, index) {
            //         return Container(
            //           width: 300.h,
            //           height: 300.h,
            //           margin: EdgeInsets.only(right: 27.w),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(15.r),
            //           ),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(15.r),
            //             child: Image.asset(childrenCartoons[index].mainImage,
            //                 fit: BoxFit.cover),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            // const SliverToBoxAdapter(
            //   child: FooterComponent(),
            // ),
          ],
        ));
  }
}

class ContinueBrowsingChapter extends StatelessWidget {
  const ContinueBrowsingChapter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118.h,
      child: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: continueWatchingMovies.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 24.w),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 153.w,
                        height: 93.h,
                        margin: EdgeInsets.only(right: 12.w, bottom: 8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          image: DecorationImage(
                            image: AssetImage(continueWatchingMovies[index].bgImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8.h,
                        child: Container(
                          height: 3.02.h,
                          width: 153.w,
                          decoration: BoxDecoration(
                            color: AppColors.selectedColor.withOpacity(0.5),
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(6.r)),
                          ),
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 37.w,
                            height: 3.02.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4.r),
                                  bottomRight: Radius.circular(4.r),
                                  bottomLeft: Radius.circular(6.r)),
                              color: AppColors.lightBlue,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 153.w,
                    child: Text(continueWatchingMovies[index].name,
                        style: AppTextStyles.body10w4, overflow: TextOverflow.ellipsis),
                  ),
                ],
              );
            },
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 124.w,
              height: 118.h,
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
      ),
    );
  }
}
