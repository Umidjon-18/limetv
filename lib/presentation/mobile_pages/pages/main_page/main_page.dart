import 'package:flutter/material.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/assets.dart';
import '../category/category_mobile_page.dart';
import '../home/home_page.dart';
import '../search_page/search_page.dart';
import '../../../pages/filter_page/filter_page.dart';
import '../../../pages/my_page/favorite_page.dart';
import '../../../pages/settings_page/settings_page.dart';
import '../../../pages/tv_page/tv_page.dart';

import '../my/my.dart';
import 'widgets/bottom_nav_bar.dart';

class MobileMainPage extends StatefulWidget {
  const MobileMainPage({super.key});

  @override
  State<MobileMainPage> createState() => _MobileMainPageState();
}

List<Widget> _pages = [
  const MobileHomePage(),
  const FavoritePage(),
  const CatergoryMobilePage(),
  const SearchPage(),
  const FilterPage(),
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
      resizeToAvoidBottomInset: false,
        body: Stack(
      children: [
        PageView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          reverse: true,
          controller: controller,
          children: _pages,
        ),
        BottomNavBar(
            selectedIndex: _selectedPage,
            onTap: (index) {
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
