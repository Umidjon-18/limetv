import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/config/constants/constants.dart';
import 'package:limetv/config/constants/local_data.dart';

class SettingsMainWidget extends StatefulWidget {
  const SettingsMainWidget({super.key});

  @override
  State<SettingsMainWidget> createState() => _SettingsMainWidgetState();
}

class _SettingsMainWidgetState extends State<SettingsMainWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          settingsMainWidgetText,
          style: AppTextStyles.body18w5,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 28.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 140.h,
                height: 140.h,
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.h, color: AppColors.personContainerColor),
                ),
                child: Container(
                  width: 129.36.h,
                  height: 129.36.h,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.personContainerColor,
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.person,
                    width: 101.6.w,
                    height: 103.9.h,
                  ),
                ),
              ),
              SizedBox(
                width: 46.w,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingsTextField(
                      hintText: settingsTextFieldTexts[0],
                      color: AppColors.settingsTextFieldAndTextColor,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SettingsTextField(
                      hintText: settingsTextFieldTexts[1],
                      color: AppColors.settingsTextFieldAndTextColor,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SettingsTextField(
                      hintText: settingsTextFieldTexts[2],
                      color: AppColors.settingsTextFieldAndTextColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            fillColor: MaterialStateProperty.resolveWith(getColor),
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Text(
                            'Детский профил',
                            style: AppTextStyles.body16w4.copyWith(
                              color:
                                  isChecked == true ? AppColors.selectedColor : AppColors.settingsTextFieldAndTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 64.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 23.w),
                          decoration: BoxDecoration(
                            color: AppColors.selectedColor,
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Text(
                            'Сохранить',
                            style: AppTextStyles.body18w4,
                          ),
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                        Container(
                          height: 64.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 23.w),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              width: 1.h,
                              color: AppColors.selectedColor,
                            ),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Text(
                            'Добавить аккаунт',
                            style: AppTextStyles.body18w4,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.selectedColor;
    }
    if (isChecked == true) {
      return AppColors.selectedColor;
    }
    return AppColors.settingsTextFieldAndTextColor;
  }
}

class SettingsTextField extends StatelessWidget {
  SettingsTextField({
    required this.hintText,
    required this.color,
    Key? key,
  }) : super(key: key);

  String hintText;
  Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 476.h,
      height: 64.h,
      child: TextField(
        style: AppTextStyles.body16w4.copyWith(
          color: AppColors.selectedColor,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide(
              width: 1.h,
              color: color,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          fillColor: AppColors.selectedColor,
          hintText: hintText,
          hintStyle: AppTextStyles.body16w4.copyWith(
            color: color,
          ),
        ),
      ),
    );
  }
}
