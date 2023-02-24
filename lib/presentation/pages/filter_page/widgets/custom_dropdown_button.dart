import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../filter_page.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedValue;
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppColors.borderColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(10),
            alignment: Alignment.bottomRight,
            menuMaxHeight: 300.h,
            value: dropdownValue,
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            underline: Container(),
            style: AppTextStyles.body16w4,
            dropdownColor: AppColors.backgroundColor,
            iconEnabledColor: AppColors.accentColor,
            iconSize: 10,
          ),
        ),
      ),
    );
  }
}
