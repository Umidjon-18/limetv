import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';
import 'package:limetv/presentation/pages/tv_page/widget/flick_controller.dart';
import 'package:limetv/presentation/pages/tv_page/widget/flick_data_manager.dart';
import 'package:limetv/presentation/pages/tv_page/widget/mock_data.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TvVideoPlayerPage extends StatefulWidget {
  const TvVideoPlayerPage({
    super.key,
    required this.channelName,
    this.index,
  });

  final String? channelName;
  final int? index;

  @override
  State<TvVideoPlayerPage> createState() => _TvVideoPlayerPageState();
}

class _TvVideoPlayerPageState extends State<TvVideoPlayerPage> {
  late FlickManager flickManager;
  late DataManager? dataManager;

  // late VideoPlayerController playerController;

  @override
  void initState() {
    super.initState();

    // playerController =
    //     VideoPlayerController.network(mockData["items"][1]["trailer_url"])
    //       ..initialize().then((value) => setState(() {}));
    // playerController.play();
    //
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network(mockData["items"][1]["trailer_url"]),
    );
    List<String> urls = (mockData["items"] as List)
        .map<String>((item) => item["trailer_url"])
        .toList();
    dataManager = DataManager(flickManager: flickManager, urls: urls);
  }

  @override
  void dispose() {
    // flickManager.dispose();
    super.dispose();
  }

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
      backgroundColor: AppColors.backgroundColorTv,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // SliverAppBar(
          //   pinned: false,
          //   snap: false,
          //   floating: true,
          //   expandedHeight: 129.h,
          //   flexibleSpace: const WebAppBar(),
          //   automaticallyImplyLeading: false,
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 72.w,top: 69.h,
                  right: MediaQuery.of(context).size.width > 1200 ? 476.w : 46),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          widget.channelName == null
                              ? Assets.images.yoshlarTv
                              : widget.channelName!,
                          width: 100.w,
                          height: 43.h,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          'Телеканал “${channelNameList[widget.index ?? 0]}”',
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
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30.h)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 72.w, right: 76.w),
              child: LayoutBuilder(
                builder: (context, constrains) {
                  if (constrains.maxWidth > 1200) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 1180.w,
                          height: 709.h,
                          margin: EdgeInsets.only(right: 28.w),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 28.h, horizontal: 30.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: AppColors.containerColor,
                          ),
                          child: VisibilityDetector(
                            key: ObjectKey(flickManager),
                            onVisibilityChanged: (visibility) {
                              if (visibility.visibleFraction == 0 && mounted) {
                                flickManager.flickControlManager?.autoPause();
                              } else if (visibility.visibleFraction == 1) {
                                flickManager.flickControlManager?.autoResume();
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: FlickVideoPlayer(
                                flickManager: flickManager,
                                flickVideoWithControls: FlickVideoWithControls(
                                  controls: WebVideoControl(
                                    dataManager: dataManager!,
                                    iconSize: 30,
                                    fontSize: 14.sp,
                                    progressBarSettings:
                                        FlickProgressBarSettings(
                                      height: 5,
                                      handleRadius: 5.5,
                                    ),
                                  ),
                                  videoFit: BoxFit.contain,
                                  // aspectRatioWhenLoading: 4 / 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 744.h,
                          width: 372.w,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(bottom: 90.h),
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 16.h);
                                },
                                itemCount:
                                    Assets.channelList.uzbekChannels.length,
                                itemBuilder: (context, index) {
                                  return _ChannelNameListView(
                                    inListView: true,
                                    channelList:
                                        Assets.channelList.uzbekChannels[index],
                                    channelName: channelNameList[index],
                                  );
                                },
                              ),
                              Container(
                                // width: 372.w,
                                height: 146.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xff03060B).withOpacity(0),
                                      const Color(0xff03060B).withOpacity(0.81),
                                      const Color(0xff03060B),
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
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 40.h),
                          height: 709.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 28.h, horizontal: 30.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: AppColors.containerColor,
                          ),
                          child: VisibilityDetector(
                            key: ObjectKey(flickManager),
                            onVisibilityChanged: (visibility) {
                              if (visibility.visibleFraction == 0 && mounted) {
                                flickManager.flickControlManager?.autoPause();
                              } else if (visibility.visibleFraction == 1) {
                                flickManager.flickControlManager?.autoResume();
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: FlickVideoPlayer(
                                flickManager: flickManager,
                                flickVideoWithControls: FlickVideoWithControls(
                                  controls: WebVideoControl(
                                    dataManager: dataManager!,
                                    iconSize: 30,
                                    fontSize: 14,
                                    progressBarSettings:
                                        FlickProgressBarSettings(
                                      height: 5,
                                      handleRadius: 5.5,
                                    ),
                                  ),
                                  videoFit: BoxFit.contain,
                                  // aspectRatioWhenLoading: 4 / 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 60.h),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 20.h,
                                  crossAxisSpacing: 20.w,
                                  childAspectRatio: 30 / 9),
                          itemBuilder: (context, index) {
                            return _ChannelNameListView(
                              inListView: false,
                              channelList:
                                  Assets.channelList.uzbekChannels[index],
                              channelName: channelNameList[index],
                            );
                          },
                          itemCount: Assets.channelList.uzbekChannels.length,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChannelNameListView extends StatelessWidget {
  _ChannelNameListView(
      {required this.inListView,
      required this.channelList,
      required this.channelName});

  String channelList;
  String channelName;
  bool inListView;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('fixed111111111111111111111111111');
      },
      child: Container(
        height: 79.h,
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: inListView ? 23.w : 33.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                channelList,
                width: inListView ? 91.w : 120.w,
                height: inListView ? 48.h : 71.h,
                alignment: Alignment.centerLeft,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 30.w),
              Text(
                channelName,
                style: inListView
                    ? AppTextStyles.body20w5.copyWith(color: Colors.white)
                    : AppTextStyles.body26w5.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
