import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/presentation/components/genre_label.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.images.signBg,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 30.0,
              sigmaY: 30.0,
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 72.w, right: 73.w, bottom: 69.h, top: 72.h),
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  GenreLabel(
                    onTap: () {},
                    title: 'Часто ищут',
                  ),
                  const SizedBox(
                    height: 32,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchActorAndDirector extends StatelessWidget {
  SearchActorAndDirector({required this.actorName, required this.actorOrDiretorText, super.key});
  String actorName;
  String actorOrDiretorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          actorName,
          style: AppTextStyles.body18w5.copyWith(
            color: const Color(0xffBDBDBD),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Text(
            actorOrDiretorText,
            style: AppTextStyles.body14w5.copyWith(color: AppColors.selectedColor),
          ),
        ),
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  SearchWidget({required this.movieNameText, required this.assetsText, super.key});
  String assetsText;
  String movieNameText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 267.4.h,
          height: 160.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Image.asset(
            assetsText,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 28.w,
        ),
        SizedBox(
          width: 198.h,
          child: Text(
            movieNameText,
            style: AppTextStyles.body18w5,
          ),
        ),
      ],
    );
  }
}
