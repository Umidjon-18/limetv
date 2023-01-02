import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';

import '../../../config/constants/local_data.dart';
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
              child: SizedBox(
                height: 482.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: skoroVKino.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 72.w),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 320.w,
                      height: 482.h,
                      margin: EdgeInsets.only(right: 27.w, bottom: 22.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        image: DecorationImage(
                          image: AssetImage(skoroVKino[index].bgImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
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
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 72.w),
                child: GridView.builder(
                  itemCount: 12,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 28,
                    crossAxisSpacing: 28,
                    childAspectRatio: 375 / 195,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 195.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColors.categoryBgColor.withOpacity(.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            categories[index].categoryIcon,
                            width: 82.h,
                            height: 82.h,
                          ),
                          SizedBox(width: 48.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(categories[index].categoryName, style: AppTextStyles.body20w5),
                              SizedBox(height: 2.h),
                              Text(
                                "(${categories[index].categoryMovieCount})",
                                style: AppTextStyles.body16w4.copyWith(color: AppColors.categoryCountColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
