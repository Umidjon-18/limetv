import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_decorations.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/config/constants/mobile_assets.dart';
import 'package:limetv/presentation/components/mobile_genre_label.dart';
import 'package:limetv/presentation/mobile_pages/pages/home/widgets/coming_to_cinema_widget.dart';

import '../../../../config/constants/local_data.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  ScrollController controller = ScrollController();
  CarouselController filmController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: 82.h,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: SvgPicture.asset(
              Assets.iconsMobile.backMobileIcon,
              height: 24,
              fit: BoxFit.none,
            ),
          ),
        ),
        title: Text(
          'Moё',
          style: AppTextStyles.body16w5,
        ),
        centerTitle: true,
      ),
      // PreferredSize(
      //   preferredSize: Size.fromHeight(114.h),
      //   child: Container(
      //     height: 114.h,
      //     color: AppColors.backgroundColor,
      //     alignment: Alignment.bottomCenter,
      //     padding: EdgeInsets.only(bottom: 27.h),
      //     child:  Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 24.w),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           const Icon(
      //             Icons.keyboard_backspace_outlined,
      //             color: AppColors.whiteF2,
      //           ),
      //           Text(
      //             'Moё',
      //             style: AppTextStyles.body14w5,
      //           ),
      //           Container()
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: MobileGenreLabel(
              onTap: () {},
              topMargin: 24.h,
              title: "Буду смотреть",
              subtitle: '24',
            ),
          ),
          SliverToBoxAdapter(
            child: FilmsCardSlider(
              controller: filmController,
              data: filmy,
              sliderHeight: 205,
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Column(children: [
          //     // SizedBox(height: 65.h),
          //     // Padding(
          //     //   padding: EdgeInsets.symmetric(horizontal: 24.w),
          //     //   child: Row(
          //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     //     children: [
          //     //       const Icon(
          //     //         Icons.keyboard_backspace_outlined,
          //     //         color: AppColors.whiteF2,
          //     //       ),
          //     //       Text(
          //     //         'Moё',
          //     //         style: AppTextStyles.body14w5,
          //     //       ),
          //     //       Container()
          //     //     ],
          //     //   ),
          //     // ),
          //     SizedBox(height: 25.h),
          //
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 24.w),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Буду смотреть',
          //             style: AppTextStyles.body14w5,
          //           ),
          //           Text(
          //             '24',
          //             style: AppTextStyles.body12w4.copyWith(
          //               color: AppColors.selectedColor,
          //               decoration: TextDecoration.underline,
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //     SizedBox(height: 12.h),
          //   ]),
          // ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 196.h,
          //     child: Stack(
          //       children: [
          //         ListView.builder(
          //           shrinkWrap: true,
          //           controller: controller,
          //           itemCount: continueWatchingMovies.length,
          //           scrollDirection: Axis.horizontal,
          //           padding: EdgeInsets.only(left: 24.w),
          //           itemBuilder: (context, index) {
          //             return Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   width: 97.w,
          //                   height: 145.h,
          //                   margin: EdgeInsets.only(
          //                     right: 12.w,
          //                   ),
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(6.r),
          //                     image: DecorationImage(
          //                       image: AssetImage(
          //                           continueWatchingMovies[index].bgImage),
          //                       fit: BoxFit.cover,
          //                     ),
          //                   ),
          //                 ),
          //                 const SizedBox(height: 8),
          //                 Text('data', style: AppTextStyles.body12w5),
          //                 const SizedBox(height: 2),
          //                 Text('data',
          //                     style: AppTextStyles.body10w4.copyWith(
          //                       color: AppColors.settingsTextFieldAndTextColor,
          //                     ))
          //               ],
          //             );
          //           },
          //         ),
          //         Positioned(
          //             right: 0,
          //             child: ScrollVideosButtonMobile(controller: controller)),
          //       ],
          //     ),
          //   ),
          // ),

          SliverToBoxAdapter(
            child: MobileGenreLabel(
              onTap: () {},
              topMargin: 24.h,
              title: "Загрузки",
              subtitle: '0',
              subtitleColor: AppColors.settingsTextFieldAndTextColor,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              height: 184.h,
              padding: EdgeInsets.only(top: 19.h,bottom: 28.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.cardBgColor),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(MobileAssets.icons.download),
                    AutoSizeText(
                      'Загружайте фильмы и сериалы,\nчтобы смотреть их без интернета',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      minFontSize: 8,
                      style: AppTextStyles.body12w4
                          .copyWith(color: AppColors.gray5),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: AppDecorations.buttonStyle(
                        bgColor: AppColors.selectedColor,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        borderRadius: 38.5.r,
                        size: Size.fromHeight(36.h),
                      ),
                      child: AutoSizeText(
                        'Выбрать, что загрузить',
                        minFontSize: 6,
                        maxLines: 1,
                        style: AppTextStyles.body12w5,
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
