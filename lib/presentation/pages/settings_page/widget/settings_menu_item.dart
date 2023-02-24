
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class SettingsMenuItem extends StatelessWidget {
  SettingsMenuItem({
    required this.text,
    required this.color,
    required this.assetsIconText,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  String text;
  String assetsIconText;
  Color color;
  bool onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          onClick ? SvgPicture.asset(
            Assets.icons.point,
            color: color,
          ) : SizedBox(width: 6.w),
          Row(
            children: [
              SizedBox(
                width: 17.3.w,
              ),
              SvgPicture.asset(
                assetsIconText,
                color: color,
              ),
              SizedBox(
                width: 17.3.w,
              ),
              Text(
                text,
                style: AppTextStyles.body18w5.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
