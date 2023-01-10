import 'dart:html';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/presentation/components/genre_label.dart';
import 'package:limetv/presentation/pages/search_page/search_page.dart';

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

  Map<String, String> actorsNameAndDirector = {
    'Джейсон Стэйтем': 'Актер',
    'Том Харди': 'Актер',
    'Дуэйн Джонсон': 'Актер',
    'Леонардо ДиКаприо': 'Актер',
    'Дмитрий Нагиев': 'Актер',
    'Уилл Смит': 'Актер, Сценарист',
  };

  Map<String, String> movieAndMovieText = {
    'Гарри Поттер: и философский камень': Assets.images.harryPotter,
    'Постучись в мою дверь': Assets.images.postuchisMoyuDver,
    'Сердце Пармы': Assets.images.serdseParme,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
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
                          right: 80.h,
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
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 30.h),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(32.r),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
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
          SizedBox(
            height: 102.h,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            height: toggle == 0 ? 0 : MediaQuery.of(context).size.height * 0.84,
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                toggle == 1
                    ? SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          Assets.images.signBg,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const SizedBox.shrink(),
                if (toggle == 1)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GenreLabel(
                        onTap: () {},
                        title: 'Часто ищут',
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 28,
                          crossAxisSpacing: 51.w,
                          childAspectRatio: 493.4.w / 160.h,
                        ),
                        itemCount: movieAndMovieText.length,
                        itemBuilder: (context, index) {
                          return SearchWidget(
                            movieNameText: movieAndMovieText.keys.elementAt(index),
                            assetsText: movieAndMovieText.values.elementAt(index),
                          );
                        },
                      ),
                      SizedBox(
                        height: 69.h,
                      ),
                      GenreLabel(
                        onTap: () {},
                        title: 'Актеры и Режиссёры',
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 28,
                          crossAxisSpacing: 55.w,
                          childAspectRatio: 10,
                        ),
                        itemCount: actorsNameAndDirector.length,
                        itemBuilder: (context, index) {
                          return SearchActorAndDirector(
                            actorName: actorsNameAndDirector.keys.elementAt(index),
                            actorOrDiretorText: actorsNameAndDirector.values.elementAt(index),
                          );
                        },
                      ),
                    ],
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
          // Expanded(
          //   child: Container(
          //     width: double.infinity,
          //     padding: EdgeInsets.only(
          //       left: 72.w,
          //       right: 73.w,
          //       bottom: 69.h,
          //     ),
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage(
          //           Assets.images.signBg,
          //         ),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     child: Column(
          //       children: [
          //         GenreLabel(
          //           onTap: () {},
          //           title: 'Часто ищут',
          //         ),
          //         SizedBox(
          //           height: 32.h,
          //         ),
          //         GridView.builder(
          //           shrinkWrap: true,
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 3,
          //             mainAxisSpacing: 28,
          //             crossAxisSpacing: 51.w,
          //             childAspectRatio: 493.4.w / 160.h,
          //           ),
          //           itemCount: movieAndMovieText.length,
          //           itemBuilder: (context, index) {
          //             return SearchWidget(
          //               movieNameText: movieAndMovieText.keys.elementAt(index),
          //               assetsText: movieAndMovieText.values.elementAt(index),
          //             );
          //           },
          //         ),
          //         SizedBox(
          //           height: 69.h,
          //         ),
          //         GenreLabel(
          //           onTap: () {},
          //           title: 'Актеры и Режиссёры',
          //         ),
          //         SizedBox(
          //           height: 28.h,
          //         ),
          //         GridView.builder(
          //           shrinkWrap: true,
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 3,
          //             mainAxisSpacing: 28,
          //             crossAxisSpacing: 55.w,
          //             childAspectRatio: 10,
          //           ),
          //           itemCount: actorsNameAndDirector.length,
          //           itemBuilder: (context, index) {
          //             return SearchActorAndDirector(
          //               actorName: actorsNameAndDirector.keys.elementAt(index),
          //               actorOrDiretorText: actorsNameAndDirector.values.elementAt(index),
          //             );
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
