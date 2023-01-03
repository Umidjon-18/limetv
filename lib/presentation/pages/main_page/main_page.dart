import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';

import '../../../config/constants/local_data.dart';
import '../../components/category_grid.dart';
import '../../components/genre_label.dart';
import '../../components/movie_carousel.dart';
import '../../components/subscription_banner.dart';
import '../../components/web_appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
              child: SizedBox(
                width: 1117.w,
                height: 888.h,
                child: const MovieCarousel(),
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
                options: CarouselOptions(
                  height: 485.h,
                  initialPage: 0,
                  reverse: false,
                  autoPlay: true,
                  enlargeFactor: 0.15,
                  aspectRatio: 2 / 3,
                  disableCenter: true,
                  viewportFraction: 0.23,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {},
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
                options: CarouselOptions(
                  height: 280.h,
                  initialPage: 0,
                  reverse: false,
                  autoPlay: true,
                  enlargeFactor: 0.15,
                  aspectRatio: 463 / 277,
                  disableCenter: true,
                  viewportFraction: 0.23,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {},
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 280.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filmy.length,
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
                          image: AssetImage(filmy[index].bgImage),
                          fit: BoxFit.cover,
                        ),
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
                title: "Сериалы",
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 280.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: serialy.length,
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
                          image: AssetImage(serialy[index].bgImage),
                          fit: BoxFit.cover,
                        ),
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
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 350.h,
                  initialPage: 0,
                  reverse: false,
                  autoPlay: true,
                  enlargeFactor: 0.15,
                  aspectRatio: 16 / 9,
                  disableCenter: true,
                  viewportFraction: 0.3,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {},
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
                items: List.generate(
                  filmy.length,
                  (index) => Container(
                    width: 463.w,
                    height: 277.h,
                    margin: EdgeInsets.only(right: 27.w, bottom: 22.h),
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
          ],
        ));
  }
}
