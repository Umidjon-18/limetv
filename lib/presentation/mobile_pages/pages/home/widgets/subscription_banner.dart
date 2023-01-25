// ignore: must_be_immutable
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/data/models/movie_model.dart';


// ignore: must_be_immutable
class SubscriptionBannerInMobile extends StatelessWidget {
  SubscriptionBannerInMobile({
    Key? key,
    required this.subscriptionMovies,
  }) : super(key: key);
  List<MovieModel> subscriptionMovies;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size.width / 6;
    return Container(
      height: 154.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.selectedColor,
            AppColors.selectedColor.withOpacity(0),
          ],
        ),
      ),
      child: Container(
        height: 154.h,
        padding: EdgeInsets.only(left: 17.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Color(0xff0C1F39),
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.centerRight,
          //   colors: [
          //     AppColors.selectedColor.withOpacity(.21),
          //     const Color(0xff143460).withOpacity(.13),
          //     const Color(0xff122F56).withOpacity(.29),
          //   ],
          // ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 34.h,
                    width: MediaQuery.of(context).size.width / 3.2,
                    child: AutoSizeText(
                      "Месяц за \$10,\nгод за полцены",
                      style: AppTextStyles.body14w5,
                      minFontSize: 6,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 6.h),
                      height: 30.h,
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: AutoSizeText(
                        r"Проводём 2023 вместе ?",
                        style: AppTextStyles.body12w4
                            .copyWith(color: AppColors.selectedColor),
                        maxLines: 2,
                        minFontSize: 6,
                        overflow: TextOverflow.ellipsis,
                      )),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 97.w,
                      height: 31.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 21.h),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.5.r),
                        color: AppColors.selectedColor,
                      ),
                      child: AutoSizeText(
                        "Конечно!",
                        style: AppTextStyles.body12w5,
                        maxLines: 1,
                        minFontSize: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    child: Container(
                      // width: 175.61.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(subscriptionMovies[0].bgImage),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60.w,
                    child: Container(
                      // width: 175.61.w,
                      height: 154.h,
                      child: Image.asset(subscriptionMovies[1].bgImage,
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Positioned(
                    left: 80.w,
                    child: Container(
                      // width: 175.61.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(subscriptionMovies[0].bgImage),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   left: 60.w,
                  //   child: Container(
                  //     width: 175.61.w,
                  //     height: 154.h,
                  //     child: Image.asset(subscriptionMovies[3].bgImage,
                  //         fit: BoxFit.fitHeight),
                  //   ),
                  // ),
                  // Container(
                  //   width: 175.61.w,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage(subscriptionMovies[2].bgImage),
                  //       fit: BoxFit.fitHeight,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: 175.61.w,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage(subscriptionMovies[3].bgImage),
                  //       fit: BoxFit.fitHeight,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            // Flexible(
            //   fit: FlexFit.tight,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       ClipPath(
            //         clipper: MyCustomClipper(),
            //         child: Container(
            //           width: size,
            //           decoration: BoxDecoration(
            //             image: DecorationImage(
            //               image: AssetImage(subscriptionMovies[0].bgImage),
            //               fit: BoxFit.fitHeight,
            //             ),
            //           ),
            //         ),
            //       ),
            //       Transform.translate(
            //         offset: const Offset(-25, 0),
            //         child: ClipPath(
            //           clipper: MyCustomClipper(),
            //           child: Container(
            //             width: size,
            //             height: 300.h,
            //             decoration: BoxDecoration(
            //               image: DecorationImage(
            //                 image: AssetImage(subscriptionMovies[1].bgImage),
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Transform.translate(
            //         offset: const Offset(-50, 0),
            //         child: ClipPath(
            //           clipper: MyCustomClipper(),
            //           child: Container(
            //             width: size,
            //             height: 300.h,
            //             decoration: BoxDecoration(
            //               image: DecorationImage(
            //                 image: AssetImage(subscriptionMovies[2].bgImage),
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Transform.translate(
            //         offset: const Offset(-75, 0),
            //         child: ClipPath(
            //           clipper: MyCustomClipper(),
            //           child: Container(
            //             constraints:
            //                 BoxConstraints(maxWidth: size, minWidth: size / 2),
            //             width: size,
            //             height: 300.h,
            //             decoration: BoxDecoration(
            //               image: DecorationImage(
            //                 image: AssetImage(subscriptionMovies[3].bgImage),
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(30, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 30, size.height)
      ..lineTo(0, size.height)
      ..lineTo(30, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
