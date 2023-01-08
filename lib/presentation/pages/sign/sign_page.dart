import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_decorations.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/presentation/routes/routes.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 73.w),
        decoration: BoxDecoration(
          color: AppColors.cartBgColor,
          image: DecorationImage(
              image: AssetImage(Assets.images.signBg), fit: BoxFit.cover),
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
                  boxShadow: [
                    BoxShadow(blurRadius: 250, color: AppColors.shadowColor)
                  ],
                  borderRadius: BorderRadius.circular(33.r),
                ),
                child: Container(
                  height: 550.h,
                  width: 525.w,
                  padding: EdgeInsets.only(top: 71.h, bottom: 93.h),
                  decoration: BoxDecoration(
                    color: AppColors.cartBgColor,
                    borderRadius: BorderRadius.circular(33.r),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(Assets.images.logo),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h, bottom: 12.h),
                        child: Text(
                          'Войдите или Регистрируйтесь',
                          style: AppTextStyles.body18w4,
                        ),
                      ),
                      Container(
                        height: 65.h,
                        width: 408.w,
                        padding: EdgeInsets.only(left: 31.w),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBgColor,
                          borderRadius: BorderRadius.circular(38.5.r),
                        ),
                        child: TextField(
                          controller: controller,
                          style: AppTextStyles.body22w4,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '+998 (--)  --- -- --',
                            hintStyle: AppTextStyles.body22w4,
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
                          if(controller.text.length == 19) {
                            Navigator.pushNamed(
                            context,
                            Routes.signCodePage,
                            arguments: {"number": controller.text},
                          );
                          }
                        },
                        style: AppDecorations.buttonStyle(
                          bgColor: AppColors.selectedColor,
                          borderRadius: 38.5.r,
                          size: Size(408.w, 70.h),
                        ),
                        child: Text(
                          'Войти',
                          style: AppTextStyles.body20w4,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      TextButton(
                        onPressed: () {},
                        style: AppDecorations.buttonStyle(
                          bgColor: AppColors.cartBgColor,
                          border: const BorderSide(
                            color: AppColors.selectedColor,
                            width: 2,
                          ),
                          borderRadius: 38.5.r,
                          size: Size(408.w, 70.h),
                        ),
                        child: Text(
                          'Регистрация',
                          style: AppTextStyles.body20w4,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '© 2023 -  LimeTV',
                style: AppTextStyles.body16w4,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'RU    Справки и поддержка',
                style: AppTextStyles.body16w4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
