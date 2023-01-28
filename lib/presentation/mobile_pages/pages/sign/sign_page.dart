import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_decorations.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/config/constants/mobile_assets.dart';
import 'package:limetv/presentation/routes/routes.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MobileSignPage extends StatefulWidget {
  const MobileSignPage({super.key});

  @override
  State<MobileSignPage> createState() => _MobileSignPageState();
}

class _MobileSignPageState extends State<MobileSignPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cartBgColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 34.w),
        decoration: BoxDecoration(
          color: AppColors.cartBgColor,
          image: DecorationImage(image: AssetImage(MobileAssets.images.signBg), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.selectedColor, Colors.transparent],
                    stops: [.3, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [BoxShadow(blurRadius: 250, color: AppColors.shadowColor)],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Container(
                  height: 265.h,
                  padding: EdgeInsets.fromLTRB(34.w, 28.h, 34.w, 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.cartBgColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(Assets.images.logo),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
                        child: Text(
                          'Войдите или Регистрируйтесь',
                          style: AppTextStyles.body10w4,
                        ),
                      ),
                      Container(
                        height: 36.h,
                        padding: EdgeInsets.only(left: 18.w),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBgColor,
                          borderRadius: BorderRadius.circular(38.5.r),
                        ),
                        child: TextField(
                          controller: controller,
                          style: AppTextStyles.body12w4,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 10.h),
                            hintText: '+998 (--)  --- -- --',
                            hintStyle: AppTextStyles.body12w4,
                          ),
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: '+998 (##) ### ## ##',
                              filter: {"#": RegExp(r'[0-9]')},
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          if (controller.text.length == 19) {
                            Navigator.pushNamed(
                              context,
                              MobileRoutes.signCodePage,
                              arguments: {"number": controller.text},
                            );
                          }
                        },
                        style: AppDecorations.buttonStyle(
                          bgColor: AppColors.selectedColor,
                          borderRadius: 38.5.r,
                          size: Size.fromHeight(36.h),
                        ),
                        child: Center(
                          child: Text(
                            'Войти',
                            style: AppTextStyles.body12w4,
                          ),
                        ),
                      ),
                      // SizedBox(height: 12.h),
                      TextButton(
                        onPressed: () {},
                        style: AppDecorations.buttonStyle(
                          bgColor: AppColors.cartBgColor,
                          border: const BorderSide(
                            color: AppColors.selectedColor,
                            width: 2,
                          ),
                          borderRadius: 38.5.r,
                          size: Size.fromHeight(36.h),
                        ),
                        child: Center(
                          child: Text(
                            'Регистрация',
                            style: AppTextStyles.body12w4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '© 2023 -  LimeTV',
                style: AppTextStyles.body9w4,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'RU    Справки и поддержка',
                style: AppTextStyles.body9w4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
