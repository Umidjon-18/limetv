import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/presentation/mobile_pages/pages/home/home_page.dart';
import 'package:limetv/presentation/mobile_pages/pages/search_page.dart';
import 'package:limetv/presentation/pages/filter_page/filter_page.dart';
import 'package:limetv/presentation/pages/my_page/favorite_page.dart';
import 'package:limetv/presentation/pages/settings_page/settings_page.dart';
import 'package:limetv/presentation/pages/tv_page/tv_page.dart';

import 'widgets/bottom_nav_bar.dart';

class MobileMainPage extends StatefulWidget {
  const MobileMainPage({super.key});

  @override
  State<MobileMainPage> createState() => _MobileMainPageState();
}

List<Widget> _pages = [
  const MobileHomePage(),
  const MyPage(),
  const TVPage(),
  const FilterPage(),
  const SearchPage(),
  const SettingsPage()
];

int _selectedPage = 0;

class _MobileMainPageState extends State<MobileMainPage> {
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
          preferredSize: Size.fromHeight(114.h),
          child: Container(
            height: 114.h,
            color: AppColors.backgroundColor,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 27.h),
            child: GestureDetector(
                onTap: () {
                  // select(0);
                },
                child: SvgPicture.asset(Assets.images.logo)),
          ),
        ),
        body: Stack(
          children: [
            PageView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              reverse: true,
              controller: controller,
              children: _pages,
            ),
            BottomNavBar(selectedIndex: _selectedPage, onTap: (index) {
              setState(() {
                _selectedPage = index;
                controller.jumpToPage(index);
              });
            })
          ],
        )
        // pages[selectedPage],
        );
  }
}
