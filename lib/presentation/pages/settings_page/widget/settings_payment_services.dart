import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';

class SettingsPaymentServices extends StatelessWidget {
  const SettingsPaymentServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Информация о счёте',
          style: AppTextStyles.body18w5,
        ),
        SizedBox(height: 26.h),
        Container(
          width: 735.w,
          // height: 213.h,
          padding: EdgeInsets.only(left: 39.w, right: 29.w, top: 32.h, bottom: 33.h),
          decoration: BoxDecoration(
            color: const Color(0xff0A101C),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Номер счёта  в LIMETV',
                style: AppTextStyles.body16w4,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 30.h),
                child: Text(
                  '3459 4023 4934',
                  style: AppTextStyles.body18w6,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Баланс:',
                        style: AppTextStyles.body16w4,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        '0 ₽',
                        style: AppTextStyles.body18w6,
                      ),
                    ],
                  ),
                  Container(
                    height: 64.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    decoration: BoxDecoration(
                      color: AppColors.selectedColor,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Text(
                      'Пополнить счёт',
                      style: AppTextStyles.body18w4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _SettingsPaymentServicesAdd(text: 'Карты', containerText: 'Добавить карту'),
        _SettingsPaymentServicesAdd(text: 'История покупки', containerText: 'Добавить карту'),
      ],
    );
  }
}

class _SettingsPaymentServicesAdd extends StatelessWidget {
  _SettingsPaymentServicesAdd({required this.text, required this.containerText});
  String text;
  String containerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 69.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTextStyles.body18w5,
          ),
          SizedBox(
            height: 28.h,
          ),
          Container(
            height: 64.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            decoration: BoxDecoration(
              color: AppColors.selectedColor,
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Text(
              containerText,
              style: AppTextStyles.body18w4,
            ),
          ),
        ],
      ),
    );
  }
}
