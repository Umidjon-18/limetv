import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/presentation/components/footer_component.dart';
import 'package:limetv/presentation/pages/filter_page/widgets/custom_dropdown_button.dart';
import 'package:limetv/presentation/pages/filter_page/widgets/filter_button.dart';
import 'package:limetv/presentation/pages/filter_page/widgets/filter_result_text.dart';
import 'package:limetv/presentation/pages/filter_page/widgets/filter_result_videos.dart';
import 'package:limetv/presentation/pages/filter_page/widgets/rubrics_button.dart';

import '../../../config/constants/constants.dart';
import '../../../config/constants/local_data.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int selectedJanr = 0;
  int selectedYear = 0;
  int selectedLanguage = 0;

  bool janrsButton = false;
  bool yearsButton = false;
  bool languageButton = false;
  bool countryButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(79.r),
              decoration: BoxDecoration(
                color: AppColors.appBarBgColor,
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.selectedColor.withOpacity(.2),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        janrsButton = !janrsButton;
                      });
                    },
                    child: RubricsButton(
                      selected: janrsButton,
                      name: 'Жанры',
                    ),
                  ),
                  SizedBox(height: 28.h),
                  Visibility(
                    visible: !janrsButton,
                    child: Wrap(
                      runSpacing: 28.h,
                      spacing: 28.w,
                      children: List.generate(
                        janrs.length,
                        (index) => GestureDetector(
                          onTap: () {
                            selectedJanr = index;
                            if (selectedJanr == index) {
                              setState(() {
                                janrBools[index] = !janrBools[index];
                              });
                            }
                          },
                          child: FilterButton(
                            text: janrs[index],
                            checked: janrBools[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 69.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                yearsButton = !yearsButton;
                              });
                            },
                            child: RubricsButton(
                              selected: yearsButton,
                              name: 'Годы',
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Visibility(
                            visible: !yearsButton,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 28.w,
                              children: [
                                Text(
                                  'от',
                                  style: AppTextStyles.body16w4,
                                ),
                                const CustomDropdownButton(),
                                Text('до', style: AppTextStyles.body16w4),
                                const CustomDropdownButton(),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 128.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                languageButton = !languageButton;
                              });
                            },
                            child: RubricsButton(
                              selected: languageButton,
                              name: 'Язык',
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Visibility(
                            visible: !languageButton,
                            child: Wrap(
                              spacing: 28.w,
                              children: List.generate(
                                languagesList.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    selectedLanguage = index;
                                    if (selectedLanguage == index) {
                                      setState(() {
                                        languageBools[index] = !languageBools[index];
                                      });
                                    }
                                  },
                                  child: FilterButton(text: languagesList[index], checked: languageBools[index]),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 69.h),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          countryButton = !countryButton;
                        });
                      },
                      child: RubricsButton(selected: countryButton, name: 'Страны'))
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.all(72.h),
                child: Column(
                  children: const [
                    FilterResultTextWidget(),
                    FilterResultVideosWidget(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 69.h),
              child: const FooterComponent(),
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> list = [
  '2000',
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2006',
  '2007',
];
