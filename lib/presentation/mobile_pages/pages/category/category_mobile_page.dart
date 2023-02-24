import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';
import 'widgets/category_mobile_grid_view.dart';

class CatergoryMobilePage extends StatefulWidget {
  const CatergoryMobilePage({super.key});

  @override
  State<CatergoryMobilePage> createState() => _CatergoryMobilePageState();
}

class _CatergoryMobilePageState extends State<CatergoryMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          toolbarHeight: 82.h,
          leading: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: SvgPicture.asset(Assets.iconsMobile.backMobileIcon,
                  height: 24, fit: BoxFit.none),
            ),
          ),
          title: Text('Катигории', style: AppTextStyles.body16w5),
          centerTitle: true,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: const CategoryMobileGridView());
  }
}
