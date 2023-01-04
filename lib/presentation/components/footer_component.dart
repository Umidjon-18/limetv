import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';
import '../../config/constants/local_data.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 406.h,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 72.w, right: 72.w, top: 51.h, bottom: 63.h),
      decoration: const BoxDecoration(
        color: Color(0xff060911),
        border: Border(top: BorderSide(width: 1, color: Color(0xff0C1E38))),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.youTube),
              SizedBox(width: 20.w),
              SvgPicture.asset(Assets.images.instagram),
              SizedBox(width: 20.w),
              SvgPicture.asset(Assets.images.telegram),
              SizedBox(width: 20.w),
              SvgPicture.asset(Assets.images.appStore),
              SizedBox(width: 20.w),
              SvgPicture.asset(Assets.images.playMarket),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bottomAboutText,
                    style: AppTextStyles.body16w4,
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
                        onPressed: () {},
                        child: Text(
                          'Cоглашение',
                          style: AppTextStyles.body16w4.copyWith(
                            color: AppColors.selectedColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.selectedColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Справка',
                          style: AppTextStyles.body16w4.copyWith(
                            color: AppColors.selectedColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.selectedColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text("© 2023 -  LimeTV", style: AppTextStyles.body16w4),
            ],
          ),
        ],
      ),
    );
  }
}
