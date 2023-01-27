import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/mobile_assets.dart';
import 'package:limetv/presentation/mobile_pages/pages/my/widget/customScrollerMobile.dart';
import 'package:limetv/presentation/mobile_pages/pages/my/widget/custom_button.dart';

import '../../../../config/constants/local_data.dart';

class My extends StatefulWidget {
  const My({super.key});

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(children: [
            SizedBox(height: 65.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.keyboard_backspace_outlined,
                    color: AppColors.whiteF2,
                  ),
                  Text(
                    'Moё',
                    style: AppTextStyles.body14w5,
                  ),
                  Container()
                ],
              ),
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Буду смотреть',
                    style: AppTextStyles.body14w5,
                  ),
                  Text(
                    '24',
                    style: AppTextStyles.body12w4.copyWith(
                      color: AppColors.selectedColor,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 12.h),
          ]),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 182.h,
            child: Stack(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  controller: controller,
                  itemCount: continueWatchingMovies.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 24.w),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 97.w,
                          height: 145.h,
                          margin: EdgeInsets.only(
                            right: 12.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            image: DecorationImage(
                              image: AssetImage(
                                  continueWatchingMovies[index].bgImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('data', style: AppTextStyles.body12w5),
                        const SizedBox(height: 2),
                        Text('data',
                            style: AppTextStyles.body10w4.copyWith(
                              color: AppColors.settingsTextFieldAndTextColor,
                            ))
                      ],
                    );
                  },
                ),
                Positioned(
                    right: 0,
                    child: ScrollVideosButtonMobile(controller: controller)),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 39.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Загрузки',
                      style: AppTextStyles.body14w5,
                    ),
                    Text(
                      '0',
                      style: AppTextStyles.body12w4.copyWith(
                        color: AppColors.settingsTextFieldAndTextColor,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            height: 184.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.cardBgColor),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(MobileAssets.icons.download),
                  Text(
                    'Загружайте фильмы и сериалы,чтобы\n смотреть их без интернета',
                    style:
                        AppTextStyles.body12w4.copyWith(color: AppColors.gray5),
                  ),
                  CustomButtonMobile(
                    text: 'Выбрать, что загрузить',
                    height: 36.h,
                    width: 184.w,
                    buttonColor: AppColors.selectedColor,
                  )
                ]),
          ),
        )
      ],
    );
  }
}
