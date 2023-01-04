import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';

class TvVideoPlayerPage extends StatefulWidget {
  const TvVideoPlayerPage({super.key});

  @override
  State<TvVideoPlayerPage> createState() => _TvVideoPlayerPageState();
}

class _TvVideoPlayerPageState extends State<TvVideoPlayerPage> {
  List<String> channelNameList = [
    'Yoshlar',
    'Sevimli',
    'Navo',
    "Dunyo bo'ylab",
    "Mahalla",
    'My5',
    "Mahalla",
    "Dunyo bo'ylab",
    'My5',
    'Yoshlar',
    'Sevimli',
    'Navo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorTvPlayer,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 72.w,
            right: 76.w,
            top: 75.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 1180.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.images.yoshlarTvPlayer,
                            width: 100.w,
                            height: 43.h,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            'Телеканал “Yoshlar”',
                            style: AppTextStyles.body20w5.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.clock,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "21:54",
                            style: AppTextStyles.body32w5.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '25 декабря',
                                  style: AppTextStyles.body15w5,
                                ),
                                Text(
                                  'Воскресенье',
                                  style: AppTextStyles.body15w5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 1180.w,
                    height: 709.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.containerColor,
                    ),
                    child: Image.asset(
                      Assets.images.channelPlay,
                      width: double.infinity,
                      height: 653.h,
                    ),
                  ),
                  SizedBox(
                    height: 744.h,
                    width: 372.w,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 16.h,
                            );
                          },
                          scrollDirection: Axis.vertical,
                          itemCount: Assets.channelList.uzbekChannels.length,
                          itemBuilder: (context, index) {
                            return _ChannelNameListView(
                              channelList: Assets.channelList.uzbekChannels[index],
                              channelName: channelNameList[index],
                            );
                          },
                        ),
                        Container(
                          width: 372.w,
                          height: 146.h,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Color(0xff03060B),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            backgroundBlendMode: BlendMode.darken,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChannelNameListView extends StatelessWidget {
  _ChannelNameListView({required this.channelList, required this.channelName});
  String channelList;
  String channelName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 372.w,
      height: 79.h,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 23.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              channelList,
              width: 91.w,
              height: 43.h,
            ),
            SizedBox(
              width: 30.w,
            ),
            Text(
              channelName,
              style: AppTextStyles.body20w5.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
