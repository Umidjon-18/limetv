import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';

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
        color:
            isSelected ? AppColors.selectedColor : AppColors.baseLight.shade100,
      ),
      label: Text(
        title,
        style: AppTextStyles.body20w5 .copyWith(
            color: isSelected
                ? AppColors.selectedColor
                : AppColors.baseLight.shade100),
      ),
    );
  }
}
