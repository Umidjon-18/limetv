import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollVideosButtonMobile extends StatelessWidget {
  const ScrollVideosButtonMobile({Key? key, required this.controller})
      : super(key: key);
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 72.w, top: 145.h, bottom: 145.h),
      height: 199.h,
      width: 124.w,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff060A12).withOpacity(0),
            const Color(0xff060A12),
          ],
        ),
      ),
    );
  }
}