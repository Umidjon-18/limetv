import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../config/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    required this.selectedIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final int selectedIndex;
  final Function onTap;
  final List<String> menuIcons = [
    'assets/mobile/icons/home.svg',
    'assets/mobile/icons/favorite.svg',
    'assets/mobile/icons/menu.svg',
    'assets/mobile/icons/search.svg',
    'assets/mobile/icons/person.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 75.h,
        margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 12.h),
        decoration: BoxDecoration(color: AppColors.cardBgColor, borderRadius: BorderRadius.circular(45.r)),
        padding: EdgeInsets.symmetric(horizontal: 37.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            menuIcons.length,
            (index) => menuItem(index),
          ),
        ),
      ),
    );
  }

  Widget menuItem(int index) {
    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 4.h),
            child: SvgPicture.asset(
              menuIcons[index],
              height: 26.h,
              width: 26.w,
              color: selectedIndex == index ? AppColors.selectedColor : AppColors.unselectedColor,
            ),
          ),
          if (selectedIndex == index)
            Container(
              width: 4.w,
              height: 4.h,
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.selectedColor),
            )
        ],
      ),
    );
  }
}
