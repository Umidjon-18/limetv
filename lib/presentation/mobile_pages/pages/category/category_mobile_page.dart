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
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 67.h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    Assets.iconsMobile.backMobileIcon,
                    width: 28.5,
                    height: 24,
                  ),
                ),
                Text(
                  'Катигории',
                  style: AppTextStyles.body16w5,
                ),
                const SizedBox.shrink()
              ],
            ),
            SizedBox(
              height: 27.h,
            ),
            const CategoryMobileGridView()
          ],
        ),
      ),
    );
  }
}
