import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/local_data.dart';

class ListOfMovies extends StatelessWidget {
  const ListOfMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 199.h,
      child: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: continueWatchingMovies.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 24.w),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 12.w),
                width: 96.67.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 96.67.w,
                      height: 145.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        image: DecorationImage(
                          image: AssetImage(continueWatchingMovies[index].bgImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.h),
                      child: Text(
                        continueWatchingMovies[index].name,
                        style: AppTextStyles.body12w5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(
                        'фэнтези',
                        style: AppTextStyles.body10w4.copyWith(
                          color: const Color(0xff828282),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 124.w,
              height: 199.h,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff060A12).withOpacity(0),
                    const Color(0xff060A12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}