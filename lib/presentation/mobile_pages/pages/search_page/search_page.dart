import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/config/constants/local_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  CarouselController filmController = CarouselController();
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: 51.h,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 52.h,
                width: 345.w,
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                padding: EdgeInsets.only(
                  left: 17.67.w,
                  right: 20.67.w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff0A101C),
                  borderRadius: BorderRadius.circular(26.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.icons.search1,
                      color: AppColors.selectedColor,
                      width: 16.93.w,
                      height: 16.93.w,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Фильмы, Персоны, Кинотеатры',
                          hintStyle: AppTextStyles.body14w4.copyWith(
                            color: AppColors.selectedColor,
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.iconsMobile.searchVector,
                      height: 18.h,
                      color: AppColors.selectedColor,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SvgPicture.asset(
                      Assets.iconsMobile.mobileSearchMenu,
                      height: 16.67.h,
                      color: AppColors.selectedColor,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 28.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Советуем посмотреть',
                      style: AppTextStyles.body14w5,
                    ),
                    Text(
                      'Все',
                      style: AppTextStyles.body12w4.copyWith(
                        color: AppColors.selectedColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 97.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 97.w,
                            height: 108.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    Assets.imagesMobile.mobileSearchImage,
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Популярные фильмы',
                            style: AppTextStyles.body12w5.copyWith(
                              color: AppColors.whiteF2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    SizedBox(
                      width: 97.w,
                      child: Column(
                        children: [
                          Container(
                            width: 97.w,
                            height: 108.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    Assets.imagesMobile.mobileSearchImage,
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Популярные сериалы',
                            style: AppTextStyles.body12w5.copyWith(
                              color: AppColors.whiteF2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 18.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Часто ишут',
                      style: AppTextStyles.body14w5,
                    ),
                    Text(
                      'Все',
                      style: AppTextStyles.body12w4.copyWith(
                        color: AppColors.selectedColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12.h,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 199.h,
                child: Stack(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: continueWatchingMovies.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 24.w),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 12.w),
                          width: 96.67.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 96.67.w,
                                height: 145.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  image: DecorationImage(
                                    image: AssetImage(continueWatchingMovies[index].bgImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 7.h),
                                child: Text(
                                  continueWatchingMovies[index].name,
                                  style: AppTextStyles.body12w5,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: Text(
                                  'фэнтези',
                                  style: AppTextStyles.body10w4.copyWith(
                                    color: const Color(0xff828282),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 124.w,
                        height: 199.h,
                        alignment: Alignment.centerRight,
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
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 18.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Популярные персоны',
                      style: AppTextStyles.body14w5,
                    ),
                    Text(
                      'Все',
                      style: AppTextStyles.body12w4.copyWith(
                        color: AppColors.selectedColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12.h,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 159.h,
                child: Stack(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: continueWatchingMovies.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 24.w),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 12.w),
                          width: 96.67.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 96.67.w,
                                height: 108.h,
                                padding: EdgeInsets.only(bottom: 8.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      searchActorsProfessions[index].mainImage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 7.h),
                                child: Text(
                                  searchActorsProfessions[index].name,
                                  style: AppTextStyles.body12w5,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: Text(searchActorsProfessions[index].prefession,
                                    style: AppTextStyles.body10w4.copyWith(color: const Color(0xff828282))),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 124.w,
                        height: 210.h,
                        alignment: Alignment.centerRight,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
