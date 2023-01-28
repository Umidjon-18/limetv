import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/config/constants/local_data.dart';
import 'package:limetv/presentation/components/mobile_genre_label.dart';
import 'package:limetv/presentation/mobile_pages/pages/home/widgets/coming_to_actors_widget.dart';
import 'package:limetv/presentation/mobile_pages/pages/home/widgets/coming_to_cinema_widget.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(82.h),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 52.h,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 28.h, left: 24.w, right: 24.w),
            padding: EdgeInsets.only(left: 17.5.w, right: 20.5.w),
            decoration: BoxDecoration(
              color: const Color(0xff0A101C),
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    Assets.icons.search1,
                    color: AppColors.selectedColor,
                    width: 17,
                    height: 17,
                  ),
                ),
                SizedBox(width: 11.w),
                Flexible(
                  child: TextField(
                    style: AppTextStyles.body14w4.copyWith(
                      color: AppColors.selectedColor,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Фильмы, Персоны, Кинотеатры',
                      hintStyle: AppTextStyles.body14w4.copyWith(
                        color: AppColors.selectedColor,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    Assets.iconsMobile.searchVector,
                    height: 18.h,
                    color: AppColors.selectedColor,
                  ),
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
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: MobileGenreLabel(
              onTap: () {},
              title: 'Советуем посмотреть',
              topMargin: 10.h,
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
            child: MobileGenreLabel(
              onTap: () {},
              title: 'Часто ишут',
              topMargin: 18.h,
            ),
          ),
          SliverToBoxAdapter(
            child: FilmsCardSlider(
              controller: filmController,
              data: filmy,
              sliderHeight: 205,
              autoPlay: false,
            ),
          ),
          SliverToBoxAdapter(
            child: MobileGenreLabel(
              onTap: () {},
              title: 'Популярные персоны',
              topMargin: 18.h,
            ),
          ),
          SliverToBoxAdapter(
            child: ActorsCardSlider(
              controller: filmController,
              data: searchActorsProfessions,
              sliderHeight: 175,
              autoPlay: false,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 110.h,
            ),
          ),
        ],
      ),
    );
  }
}
