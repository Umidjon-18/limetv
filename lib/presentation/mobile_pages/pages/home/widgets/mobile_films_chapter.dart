// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:limetv/config/constants/app_colors.dart';
// import 'package:limetv/config/constants/app_text_styles.dart';
// import 'package:limetv/config/constants/local_data.dart';
// import 'package:limetv/data/models/movie_model.dart';
// import 'package:limetv/presentation/components/carousel_options.dart';
//
// class FilmsCardSlider extends StatelessWidget {
//   const FilmsCardSlider(
//       {super.key, required this.filmController, required this.data});
//
//   final CarouselController filmController;
//   final List<MovieModel> data;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CarouselSlider(
//           carouselController: filmController,
//           options: LandingCarouselOptions(height: 205),
//           items: List.generate(
//             filmy.length,
//             (index) => CardSliderItem(index: index),
//           ),
//         ),
//         Positioned(
//           right: 0,
//           child: Container(
//             width: 124.w,
//             height: 208.h,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   const Color(0xff060A12).withOpacity(0),
//                   const Color(0xff060A12),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class CardSliderItem extends StatelessWidget {
//   const CardSliderItem({super.key, required this.index});
//
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 140.h,
//           margin: EdgeInsets.only(right: 12.w),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.r),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(6.r),
//             child: Image.asset(
//               filmy[index].bgImage,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(right: 10.w, top: 8.h),
//           child: AutoSizeText(
//             skoroVKino[index].name,
//             style: AppTextStyles.body12w5.copyWith(color: AppColors.whiteF2),
//             minFontSize: 6,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(right: 10.w, top: 2.h),
//           child: AutoSizeText(
//             skoroVKino[index].genre.substring(0, 10),
//             style: AppTextStyles.body10w4
//                 .copyWith(color: AppColors.settingsTextFieldAndTextColor),
//             minFontSize: 6,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     );
//   }
// }
