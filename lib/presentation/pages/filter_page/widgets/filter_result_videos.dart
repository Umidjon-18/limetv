import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/assets.dart';

class FilterResultVideosWidget extends StatelessWidget {
  const FilterResultVideosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h),
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 3 / 2,

        // padding: const EdgeInsets.all(20),
        crossAxisSpacing: 28.w,
        mainAxisSpacing: 10.h,
        crossAxisCount: 4,
        children: List.generate(
          20,
          (index) => ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(Assets.images.prince),
          ),
        ),
      ),
    );
  }
}
