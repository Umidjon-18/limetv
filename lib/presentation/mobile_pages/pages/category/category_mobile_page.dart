import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/presentation/mobile_pages/pages/category/widgets/category_mobile_grid_view.dart';

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
          leading: GestureDetector(
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
