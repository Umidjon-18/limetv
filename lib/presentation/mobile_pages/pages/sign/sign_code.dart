import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_decorations.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/config/constants/mobile_assets.dart';
import 'package:limetv/presentation/routes/routes.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MobileSignCodePage extends StatefulWidget {
  const MobileSignCodePage({super.key, this.number});

  final String? number;

  @override
  State<MobileSignCodePage> createState() => _MobileSignCodePageState();
}

class _MobileSignCodePageState extends State<MobileSignCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 34.w),
        decoration: BoxDecoration(
          color: AppColors.cartBgColor,
          image: DecorationImage(
              image: AssetImage(MobileAssets.images.signBg), fit: BoxFit.cover),
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
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Container(
                  height: 308.h,
                  padding: EdgeInsets.fromLTRB(34.w, 28.h, 34.w, 24.h),
                  decoration: BoxDecoration(
                    color: AppColors.cartBgColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(Assets.images.logo),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
                        child: Text(
                          "Введите код из смс.\nМы отправили его на номер\n${addStar(widget.number ?? '+998 (99) 308 39 46')}",
                          style: AppTextStyles.body10w4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: 36.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 31.w),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBgColor,
                          borderRadius: BorderRadius.circular(38.5.r),
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body12w4,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '_  _  _   _  _  _',
                            hintStyle: AppTextStyles.body14w4
                                .copyWith(color: AppColors.selectedColor),
                          ),
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: '# # #   # # #',
                              filter: {"#": RegExp(r'[0-9]')},
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MobileRoutes.mainPage);
                        },
                        style: AppDecorations.buttonStyle(
                          bgColor: AppColors.selectedColor,
                          borderRadius: 38.5.r,
                          size: Size.fromHeight(36.h),
                        ),
                        child: Center(
                          child: Text(
                            'Далее',
                            style: AppTextStyles.body12w4,
                          ),
                        ),
                      ),
                      // SizedBox(height: 16.h),
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
                        child: const Center(child: TimeText()),
                      )
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

  String addStar(String number) {
    String result;
    if (number.length >= 14) {
      result = number.replaceRange(9, 16, ' *** ** ');
    } else {
      result = number;
    }
    return result;
  }
}

class TimeText extends StatefulWidget {
  const TimeText({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeText> createState() => _TimeTextState();
}

class _TimeTextState extends State<TimeText> {
  int time = 60;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        log(timer.tick.toString());
        setState(() {
          time -= 1;
        });
        if (time == 0) {
          timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Отправить ещё код (',
        style: AppTextStyles.body12w4,
        children: [
          TextSpan(
            text: '00:${time<10?0:''}$time',
            style: AppTextStyles.body12w4.copyWith(
              color: AppColors.redText,
            ),
          ),
          TextSpan(text: ')', style: AppTextStyles.body12w4),
        ],
      ),
    );
  }
}
