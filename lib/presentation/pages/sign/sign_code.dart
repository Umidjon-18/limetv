import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limetv/presentation/routes/routes.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_decorations.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';

class SignCodePage extends StatefulWidget {
  const SignCodePage({super.key, this.number});
  final String? number;

  @override
  State<SignCodePage> createState() => _SignCodePageState();
}

class _SignCodePageState extends State<SignCodePage> {
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
                  height: 584.h,
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
                          "Введите код из смс.\nМы отправили его на номер\n${addStar(widget.number ?? '+998 (99) 308 39 46')}",
                          style: AppTextStyles.body18w4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: 65.h,
                        width: 408.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 31.w),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBgColor,
                          borderRadius: BorderRadius.circular(38.5.r),
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body22w4,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '_  _  _   _  _  _',
                            hintStyle: AppTextStyles.body24w4
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
                          Navigator.pushNamed(context, Routes.mainPage);
                        },
                        style: AppDecorations.buttonStyle(
                          bgColor: AppColors.selectedColor,
                          borderRadius: 38.5.r,
                          size: Size(408.w, 70.h),
                        ),
                        child: Text(
                          'Далее',
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
                        child: const TimeText(),
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
        style: AppTextStyles.body20w4,
        children: [
          TextSpan(
            text: '00:${time<10?0:''}$time',
            style: AppTextStyles.body20w4.copyWith(
              color: AppColors.redText,
            ),
          ),
          TextSpan(text: ')', style: AppTextStyles.body20w4),
        ],
      ),
    );
  }
}
