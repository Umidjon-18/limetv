import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';

class ComplaintsAndSuggestionPage extends StatefulWidget {
  const ComplaintsAndSuggestionPage({super.key});

  @override
  State<ComplaintsAndSuggestionPage> createState() =>
      _ComplaintsAndSuggestionPageState();
}

class _ComplaintsAndSuggestionPageState
    extends State<ComplaintsAndSuggestionPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Жалобы и предложения',
          style: AppTextStyles.body18w5,
        ),
        SizedBox(height: 16.h),
        Text(
          'текст',
          style: AppTextStyles.body16w4.copyWith(color: AppColors.borderColor),
        )
      ],
    );
  }
}
