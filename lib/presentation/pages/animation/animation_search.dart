import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_decorations.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';

class AnimationSearch extends StatefulWidget {
  const AnimationSearch({super.key});

  @override
  State<AnimationSearch> createState() => _AnimationSearchState();
}

class _AnimationSearchState extends State<AnimationSearch> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int toggle = 0;  

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 650,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 64.h,
              width: 569.w,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 64.h,
                width: (toggle == 0) ? 64.h : 569.w,
                curve: Curves.easeInOut,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(32.r),
                  border: toggle == 1
                      ? Border.all(
                          width: 1,
                          color: AppColors.selectedColor,
                        )
                      : null,
                ),
                child: Stack(
                  children: [
                    toggle == 1
                        ? AnimatedPositioned(
                            left: 25.h,
                            curve: Curves.easeInOut,
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            child: AnimatedOpacity(
                              opacity: (toggle == 0) ? 0.0 : 1.0,
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              child: Container(
                                height: 64.h,
                                width: 450.w,
                                alignment: Alignment.center,
                                child: TextField(
                                  style: AppTextStyles.body16w4,
                                  cursorRadius: const Radius.circular(10.0),
                                  cursorWidth: 2.0,
                                  cursorHeight: 18,
                                  cursorColor: AppColors.selectedColor,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    labelText: 'Search...',
                                    labelStyle: AppTextStyles.body16w4,
                                    alignLabelWithHint: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    Align(
                      alignment: toggle == 1 ? Alignment.centerRight : Alignment.center,
                      child: Padding(
                        padding: toggle == 0 ? EdgeInsets.zero : EdgeInsets.only(right: 30.h),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.r),
                          onTap: () {
                            setState(() {
                              if (toggle == 0) {
                                toggle = 1;
                                _controller.forward();
                              } else {
                                toggle = 0;
                                _controller.reverse();
                              }
                            });
                          },
                          child: AnimatedBuilder(
                            animation: _controller,
                            child: Image.asset(
                              Assets.icons.search1,
                              width: 20.h,
                              height: 20.h,
                              color: Colors.white,
                            ),
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _controller.value * 2.0 * pi,
                                child: child,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
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
