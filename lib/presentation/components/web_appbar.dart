import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';

class WebAppBar extends StatefulWidget with PreferredSizeWidget {
  const WebAppBar({super.key});

  @override
  State<WebAppBar> createState() => _WebAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(129.h);
}

class _WebAppBarState extends State<WebAppBar> {
  List<bool> indexes = [true, false, false, false];
  void select(int index) {
    indexes.clear();
    indexes = List.generate(4, (i) => i == index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 129.h,
      color: AppColors.appBarBgColor,
      padding: EdgeInsets.only(left: 76.w, right: 72.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //#logo picture
          SvgPicture.asset(Assets.images.logo),
          //#menu types
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuTextButton(
                    onPressed: () {
                      select(0);
                    },
                    icon: Assets.icons.home,
                    isSelected: indexes[0],
                    title: "Главный"),
                SizedBox(width: 40.w),
                MenuTextButton(
                    onPressed: () {
                      select(1);
                    },
                    icon: Assets.icons.favorite,
                    isSelected: indexes[1],
                    title: "Моё"),
                SizedBox(width: 40.w),
                MenuTextButton(
                    onPressed: () {
                      select(2);
                    },
                    icon: Assets.icons.tv,
                    isSelected: indexes[2],
                    title: "Тв"),
                SizedBox(width: 40.w),
                MenuTextButton(
                    onPressed: () {
                      select(3);
                    },
                    icon: Assets.icons.filter,
                    isSelected: indexes[3],
                    title: "Фильтрация"),
                SizedBox(width: 40.w),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Assets.icons.search, width: 20.h, height: 20.h),
                ),
              ],
            ),
          ),
          //#profile picture
          Container(
            width: 64.h,
            height: 64.h,
            padding: EdgeInsets.all(2.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2.h, color: AppColors.selectedColor),
            ),
            child: Container(
              width: 62.h,
              height: 62.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.selectedColor,
              ),
              child: const Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuTextButton extends StatelessWidget {
  const MenuTextButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.isSelected,
    required this.title,
  }) : super(key: key);

  final Function() onPressed;
  final String icon;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        width: 20.h,
        color: isSelected ? AppColors.selectedColor : AppColors.baseLight.shade100,
      ),
      label: Text(
        title,
        style:
            AppTextStyles.body16w5.copyWith(color: isSelected ? AppColors.selectedColor : AppColors.baseLight.shade100),
      ),
    );
  }
}
