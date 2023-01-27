import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';

import 'package:limetv/presentation/pages/search_page/search_page.dart';
import 'package:limetv/presentation/pages/settings_page/settings_page.dart';

class AnimationSearch extends StatefulWidget {
  const AnimationSearch({super.key});

  @override
  State<AnimationSearch> createState() => _AnimationSearchState();
}

class _AnimationSearchState extends State<AnimationSearch>
    with TickerProviderStateMixin {
  // late AnimationController _controller;
  // int toggle = 0;

  final List<Widget> _pages = [];

  // late final Animation<Offset> _offsetAnimation = Tween<Offset>(
  //   begin: const Offset(-1, 0),
  //   end: Offset.zero,
  // ).animate(CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.easeInOut,
  // ));

  PageController controller = PageController();

  List<bool> indexes = [true, false];

  int _selectedPage = 0;

  void select(int index) {
    indexes.clear();
    indexes = List.generate(2, (i) => i == index);
    setState(() {
      _selectedPage = index;
    });
    controller.jumpToPage(_selectedPage);
  }

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(
    //     milliseconds: 500,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(129.h),
        child: Container(
          height: 129.h,
          width: double.infinity,
          color: AppColors.appBarBgColor,
          padding: EdgeInsets.only(left: 76.w, right: 72.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  select(0);
                },
                child: SvgPicture.asset(
                  Assets.images.logo,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   height: 64.h,
                    //   width: 558.w,
                    //   alignment: Alignment.centerRight,
                    //   child: AnimatedContainer(
                    //     duration: const Duration(milliseconds: 500),
                    //     height: 64.h,
                    //     width: (toggle == 0) ? 64.h : 558.w,
                    //     curve: Curves.easeInOut,
                    //     alignment: Alignment.centerLeft,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(32.r),
                    //       border: toggle == 1
                    //           ? Border.all(
                    //               width: 1,
                    //               color: AppColors.selectedColor,
                    //             )
                    //           : null,
                    //     ),
                    //     child: Stack(
                    //       children: [
                    //         toggle == 1
                    //             ? AnimatedPositioned(
                    //                 right: 80.h,
                    //                 left: 25.h,
                    //                 curve: Curves.easeInOut,
                    //                 duration: const Duration(
                    //                   milliseconds: 500,
                    //                 ),
                    //                 child: AnimatedOpacity(
                    //                   opacity: (toggle == 0) ? 0.0 : 1.0,
                    //                   duration: const Duration(
                    //                     milliseconds: 500,
                    //                   ),
                    //                   child: Container(
                    //                     height: 64.h,
                    //                     width: 450.w,
                    //                     alignment: Alignment.center,
                    //                     child: TextField(
                    //                       style: AppTextStyles.body16w4,
                    //                       cursorRadius: const Radius.circular(10.0),
                    //                       cursorWidth: 2.0,
                    //                       cursorHeight: 18,
                    //                       cursorColor: AppColors.selectedColor,
                    //                       decoration: InputDecoration(
                    //                         floatingLabelBehavior: FloatingLabelBehavior.never,
                    //                         labelText: 'Search...',
                    //                         labelStyle: AppTextStyles.body16w4,
                    //                         alignLabelWithHint: true,
                    //                         border: OutlineInputBorder(
                    //                           borderRadius: BorderRadius.circular(20.0),
                    //                           borderSide: BorderSide.none,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               )
                    //             : SizedBox(
                    //                 height: 64.h,
                    //               ),
                    //         Align(
                    //           alignment: Alignment.centerRight,
                    //           child: Padding(
                    //             padding: EdgeInsets.only(right: 30.h),
                    //             child: InkWell(
                    //               borderRadius: BorderRadius.circular(32.r),
                    //               overlayColor: MaterialStateProperty.all(Colors.transparent),
                    //               onTap: () {
                    //                 setState(() {
                    //                   if (toggle == 0) {
                    //                     toggle = 1;
                    //                     _controller.forward();
                    //                   } else {
                    //                     toggle = 0;
                    //                     _controller.reverse();
                    //                   }
                    //                 });
                    //                 select(1);
                    //               },
                    //               child: AnimatedBuilder(
                    //                 animation: _controller,
                    //                 child: Image.asset(
                    //                   Assets.icons.search1,
                    //                   width: 20.h,
                    //                   height: 20.h,
                    //                   color: Colors.white,
                    //                 ),
                    //                 builder: (context, child) {
                    //                   return Transform.rotate(
                    //                     angle: _controller.value * 2.0 * pi,
                    //                     child: child,
                    //                   );
                    //                 },
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: 569.w,
                      height: 64.h,
                      child: TextField(
                        style: AppTextStyles.body16w4.copyWith(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.h,
                              color: const Color(0xff2F80ED),
                            ),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          hintText: 'Введите название канала',
                          hintStyle: AppTextStyles.body16w4.copyWith(
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.only(left: 30.w),
                          fillColor: const Color(0xff2F80ED),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                right: 30.w, top: 5.h, bottom: 5.h),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.r),
                              onTap: () {
                                select(1);
                              },
                              child: Image.asset(
                                Assets.icons.search1,
                                color: Colors.white,
                                width: 20.h,
                                height: 20.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  select(2);
                  setState(() {});
                },
                child: Container(
                  width: 64.w,
                  height: 64.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 2.h, color: AppColors.selectedColor),
                  ),
                  child: Container(
                    width: 60.w,
                    height: 60.h,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.personContainerColor,
                    ),
                    child: SvgPicture.asset(
                      Assets.icons.person,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            _selectedPage = value;
          });
        },
        children: [
          const SizedBox.shrink(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 102.h,
              ),
              Expanded(
                child: SearchPage(),
              ),
            ],
          ),
          const SettingsPage(),
        ],
      ),
    );
  }
}

//           SizedBox(
//             height: 102.h,
//           ),
//           Expanded(
//             child: SlideTransition(
//               position: _offsetAnimation,
//               child: SearchPage(),
//             ),
//           ),
