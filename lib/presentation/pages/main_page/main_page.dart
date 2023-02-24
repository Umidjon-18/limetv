import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/assets.dart';
import '../filter_page/filter_page.dart';
import '../landing_page/landing_page.dart';
import 'widgets/menu_button.dart';
import '../my_page/favorite_page.dart';
import '../search_page/search_page.dart';
import '../settings_page/settings_page.dart';
import '../tv_page/tv_page.dart';
import '../../routes/routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

List<Widget> _pages = [
  const LandingPage(),
  const MyPage(),
  const TVPage(),
  const FilterPage(),
  SearchPage(),
  const SettingsPage()
];

int _selectedPage = 0;

class _MainPageState extends State<MainPage> {
  PageController controller = PageController();

  List<bool> indexes = [true, false, false, false];
  void select(int index) {
    indexes.clear();
    indexes = List.generate(4, (i) => i == index);
    setState(() {
      _selectedPage = index;
    });
    controller.jumpToPage(_selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(129.h),
          child: Container(
            height: 129.h,
            color: AppColors.appBarBgColor,
            padding: EdgeInsets.only(left: 76.w, right: 72.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //#logo picture
                GestureDetector(
                  onTap: () {
                    select(0);
                  },
                  child: SvgPicture.asset(Assets.images.logo),
                ),
                //#menu types
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuTextButton(
                          onPressed: () {
                            select(0);
                          },
                          icon: Assets.icons.home,
                          isSelected: indexes[0],
                          title: "Главный"),
                      SizedBox(width: 40.w),
                      MenuTextButton(
                          onPressed: () {
                            select(1);
                          },
                          icon: Assets.icons.favorite,
                          isSelected: indexes[1],
                          title: "Моё"),
                      SizedBox(width: 40.w),
                      MenuTextButton(
                          onPressed: () {
                            select(2);
                          },
                          icon: Assets.icons.tv,
                          isSelected: indexes[2],
                          title: "Тв"),
                      SizedBox(width: 40.w),
                      MenuTextButton(
                          onPressed: () {
                            select(3);
                          },
                          icon: Assets.icons.filter,
                          isSelected: indexes[3],
                          title: "Фильтрация"),
                      SizedBox(width: 40.w),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.animationSearch);
                        },
                        icon: SvgPicture.asset(
                          Assets.icons.search,
                          color: Colors.white,
                          width: 24.h,
                          height: 24.h,
                        ),
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    select(5);
                  },
                  child: Container(
                    width: 64.w,
                    height: 64.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.h, color: AppColors.selectedColor),
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
          reverse: true,
          controller: controller,
          onPageChanged: (num) {
            setState(() {
              _selectedPage = num;
            });
          },
          children: _pages,
        )
        // pages[selectedPage],
        );
  }
}
