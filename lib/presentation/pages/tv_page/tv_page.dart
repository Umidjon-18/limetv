import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limetv/config/constants/app_colors.dart';
import 'package:limetv/config/constants/app_text_styles.dart';
import 'package:limetv/config/constants/assets.dart';

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
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 69.h,
            ),
            Center(
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
                      padding: EdgeInsets.only(right: 30.w),
                      child: Image.asset(
                        Assets.icons.search1,
                        color: Colors.white,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 69.h),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 72.w),
              child: ChannelGridView(
                text: 'Узбекские телеканалы',
                channelTextList: Assets.channelList.uzbekChannels,
              ),
            ),
            SizedBox(
              height: 69.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 72.w),
              child: ChannelGridView(
                text: 'Русские телеканалы',
                channelTextList: Assets.channelList.russianChannels,
              ),
            ),
            SizedBox(
              height: 69.h,
            ),
            Container(
              width: double.infinity,
              height: 406.h,
              decoration: const BoxDecoration(
                color: Color(0xff060911),
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Color(0xff0C1E38),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 53.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.images.youTube),
                        sized,
                        SvgPicture.asset(Assets.images.instagram),
                        sized,
                        SvgPicture.asset(Assets.images.telegram),
                        sized,
                        SvgPicture.asset(Assets.images.appStore),
                        sized,
                        SvgPicture.asset(Assets.images.playMarket),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 146.h, left: 72.w),
                    child: Text(
                      '''© 2023 LimeTV.  18+
Федеральные каналы доступны для бесплатного просмотра круглосуточно
HBO ® and related service marks are the property of Home Box Office, Inc
ООО «LIMETVUZ», адрес местонахождения: 115035, Узбекистан, г. Ташкент, ул. Садовническая, д. 82, стр. 2, пом. 9А01
Адрес для обращений пользователей: info@limetv.uz
''',
                      style: AppTextStyles.body16w4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 72.w, top: 0),
                    child: Row(
                      children: [
                        Text(
                          'Cоглашение',
                          style: AppTextStyles.body16w4.copyWith(
                            color: const Color(0xff2F80ED),
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xff2F80ED),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Справка',
                          style: AppTextStyles.body16w4.copyWith(
                            color: const Color(0xff2F80ED),
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xff2F80ED),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text,
                style: AppTextStyles.body22w7.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              SvgPicture.asset(
                Assets.icons.play,
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 28.h,
            mainAxisSpacing: 28.h,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            return ChannelName(
              text: channelTextList[index],
            );
          },
        ),
      ],
    );
  }
}

class ChannelName extends StatelessWidget {
  ChannelName({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.h,
      height: 239.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xff0A101C),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Image.asset(
        text,
        alignment: Alignment.center,
        width: 200.h,
        height: 200.h,
      ),
    );
  }
}
