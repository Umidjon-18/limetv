// ignore: must_be_immutable
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';
import '../../data/models/movie_model.dart';

// ignore: must_be_immutable
class SubscriptionBanner extends StatelessWidget {
  SubscriptionBanner({
    Key? key,
    required this.subscriptionMovies,
  }) : super(key: key);
  List<MovieModel> subscriptionMovies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 8;
    return Container(
      width: 1584.w,
      height: 306.h,
      margin: EdgeInsets.symmetric(horizontal: 72.w, vertical: 70.h),
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          colors: [
            AppColors.selectedColor,
            AppColors.selectedColor.withOpacity(.8),
            AppColors.selectedColor.withOpacity(.5),
            AppColors.selectedColor.withOpacity(.3),
          ],
        ),
      ),
      child: Container(
        height: 304.h,
        // width: double.maxFinite,
        padding: EdgeInsets.only(left: 61.w),
        decoration: BoxDecoration(
          color: AppColors.appBarBgColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: AutoSizeText(
                    r"Месяц за $10, год за полцены",
                    style: AppTextStyles.head36w5,
                    minFontSize: 6,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: AutoSizeText(
                      r"Проводём 2023 вместе ?",
                      style: AppTextStyles.body22w5
                          .copyWith(color: AppColors.selectedColor),
                      maxLines: 1,
                      minFontSize: 6,
                      overflow: TextOverflow.ellipsis,
                    )),
                Container(
                  width: 218.w,
                  height: 61.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 53.h),
                  padding: EdgeInsets.symmetric(horizontal: 55.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.5.r),
                    color: AppColors.selectedColor,
                  ),
                  child: AutoSizeText(
                    "Конечно!",
                    style: AppTextStyles.body22w5,
                    maxLines: 1,
                    minFontSize: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      width: size,
                      height: 300.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(subscriptionMovies[0].bgImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-25, 0),
                    child: ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        width: size,
                        height: 300.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(subscriptionMovies[1].bgImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-50, 0),
                    child: ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        width: size,
                        height: 300.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(subscriptionMovies[2].bgImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-75, 0),
                    child: ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: size, minWidth: size / 2),
                        width: size,
                        height: 300.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(subscriptionMovies[3].bgImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 36.h,
                height: 36.h,
                padding: EdgeInsets.all(10.h),
                margin: EdgeInsets.only(top: 18.h, right: 18.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.selectedColor.withOpacity(.1),
                ),
                child: SvgPicture.asset(Assets.icons.cancel),
              ),
            ),
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
