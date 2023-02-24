import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';
import '../../components/footer_component.dart';
import '../../components/genre_label.dart';
import 'tv_video_player_page.dart';
import '../../routes/routes.dart';

class TVPage extends StatefulWidget {
  const TVPage({super.key});

  @override
  State<TVPage> createState() => _TVPageState();
}

class _TVPageState extends State<TVPage> {
  var sized = SizedBox(
    width: 20.w,
  );

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
          // ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 69.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: SizedBox(
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
                      padding: EdgeInsets.only(right: 30.w, top: 5.h, bottom: 5.h),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.r),
                        onTap: () {},
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
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: 69.h,
                left: 72.w,
                right: 72.w,
              ),
              child: ChannelGridView(
                text: 'Узбекские телеканалы',
                channelTextList: Assets.channelList.uzbekChannels,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: 72.w,
                right: 72.w,
                top: 69.h,
              ),
              child: ChannelGridView(
                text: 'Русские телеканалы',
                channelTextList: Assets.channelList.russianChannels,
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

// ignore: must_be_immutable
class ChannelGridView extends StatelessWidget {
  ChannelGridView({super.key, required this.text, required this.channelTextList});

  String text;
  List<String> channelTextList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenreLabel(
          onTap: () {},
          margin: EdgeInsets.zero,
          title: text,
        ),
        SizedBox(
          height: 32.h,
        ),
        // SizedBox(
        //   width: double.infinity,
        //   child: List.generate(channelTextList.length, (index) {
        //     return ChannelName(text: channelNameList[index], index: index);
        //   }),
        // ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 28.h,
            mainAxisSpacing: 28.h,
          ),
          itemCount: channelTextList.length,
          itemBuilder: (context, index) {
            return ChannelName(
              text: channelTextList[index],
              index: index,
            );
          },
        ),
      ],
    );
  }
}

class ChannelName extends StatelessWidget {
  ChannelName({Key? key, required this.text, required this.index}) : super(key: key);
  String text;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.tvVideoPlayerPage,
          arguments: {
            'channelName': text,
            'index': index,
          },
        );
      },
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        width: 240.w,
        height: 239.h,
        decoration: BoxDecoration(
          color: const Color(0xff0A101C),
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Image.asset(
          text,
          fit: BoxFit.contain,
          width: 200.h,
          height: 200.h,
        ),
      ),
    );
  }
}
