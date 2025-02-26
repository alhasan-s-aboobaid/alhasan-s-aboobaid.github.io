import 'dart:math';

import 'package:alhasan_abo_obaid/core/painters/bubble_painter.dart';
import 'package:alhasan_abo_obaid/core/painters/bubble_stroke_painter.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/constants.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/icon_manager.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/core/widgets/animated_bubbles.dart';
import 'package:alhasan_abo_obaid/core/widgets/animated_text_count.dart';
import 'package:alhasan_abo_obaid/core/widgets/custom_button.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileSection extends StatelessWidget {
  final Sizes sizes;

  const ProfileSection({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: 16.all,
                  child: CircleAvatar(
                    radius: sizes.profileImageSize * .4,
                    foregroundImage:
                    const AssetImage(IconManager.profileImage),
                    child: const AnimatedBubbles(type: "", size: "large",), // Replace with your image
                  ),
                ),
              ),


            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: sizes.sectionPadding, right: sizes.sectionPadding, top: 8, bottom: 16),
            child: Stack(
              children: [
                const AnimatedBubbles(type: "stroke", size: "large",),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    EntranceFader(
                      duration: const Duration(milliseconds: 400),
                      child: Text("👋 Hi there, I'm Alhasan",
                          style: Theme.of(context).styles.bodyRegularLarge.copyWith(
                              color: Theme.of(context).themeColors.textBody, fontSize: sizes.homeGreetingTitle)),
                    ),
                    8.verticalSpace,
                    EntranceFader(
                      duration: Duration(milliseconds: 600),
                      child: Text("Innovating Digital Interfaces",
                          style: Theme.of(context).styles.headingLarge.copyWith(
                              fontSize: sizes.homeTitle1,
                              color: Theme.of(context).themeColors.textBody)),
                    ),
                    EntranceFader(
                      duration: Duration(milliseconds: 800),
                      child: Text("For a Better Tomorrow",
                          style: Theme.of(context).styles.headingLarge.copyWith(
                              fontSize: sizes.homeTitle1,
                              color: Theme.of(context).themeColors.primaryColor)),
                    ),
                    4.verticalSpace,
                    EntranceFader(
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                          "I help turn your vision into reality by designing and developing digital products that put the user at the heart of the experience.\nwith more than 8 years of experience.",
                          style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                              fontSize: sizes.homeSubtitle,
                              color: Theme.of(context).themeColors.disabledButton)),
                    ),
                    16.verticalSpace,
                    if(ScreenSizeUtil.getScreenType(context) != ScreenType.desktop)
                      EntranceFader(
                        offset: Offset(50, 0),
                        child: CustomButton(
                          title: "Download CV",
                          onPressed: () {
                            launchUrlString(Constants.cvUrl);
                          },
                        ),
                      ),

                  ],
                ),
              ],
            ),
          ),
          160.verticalSpace,
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                horizontal: 16.w, vertical: 8.h
            ),
            color: Colors.black87.withOpacity(.7),
            child: Column(
              children: [
                8.verticalSpace,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AnimatedText(count: 8, label: "Years of\nExperience"),
                    8.horizontalSpace,
                    const AnimatedText(count: 15, label: "Projects\nCompleted"),
                    8.horizontalSpace,
                    const AnimatedText(count: 100, label: "Success\nRate", hasPercentSign: true, hasPlusSign: false,),
                    8.horizontalSpace,

                  ],),
                32.verticalSpace,
                Text("Companies I worked with", style: Theme.of(context).styles.headingLarge.copyWith(
                  color: Colors.white70
                ),),
                4.verticalSpace,
                Text("I have implemented and published tens of apps with many agents and customers",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                      fontSize: sizes.homeSubtitle,
                      color: Theme.of(context).themeColors.disabledButton),),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                  Image.asset(IconManager.maidsccLogo, width: 32.w, height: 32.h, color: Theme.of(context).themeColors.primaryLight,),
                  8.horizontalSpace,
                  Image.asset(IconManager.electromall, width: 32.w, height: 32.h, color: Theme.of(context).themeColors.primaryLight,),
                  8.horizontalSpace,
                  Image.asset(IconManager.datum, width: 32.w, height: 32.h, color: Theme.of(context).themeColors.primaryLight,),
                  8.horizontalSpace,
                  Image.asset(IconManager.shamra, width: 32.w, height: 32.h, color: Theme.of(context).themeColors.primaryLight,),
                  8.horizontalSpace,
                  Image.asset(IconManager.kelshimall, width: 32.w, height: 32.h, color: Theme.of(context).themeColors.primaryLight,),
                  8.horizontalSpace,
                  Image.asset(IconManager.scit, width: 32.w, height: 32.h, color: Theme.of(context).themeColors.primaryLight,),
                  8.horizontalSpace,
                ],),
                24.verticalSpace,
                Divider(color: Colors.grey[800],),
                24.verticalSpace,
                EntranceFader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    const IconWidget(iconPath: IconManager.figma),
                    8.horizontalSpace,
                    const IconWidget(iconPath: IconManager.dart),
                    8.horizontalSpace,
                    const IconWidget(iconPath: IconManager.flutter),
                    8.horizontalSpace,
                    const IconWidget(iconPath: IconManager.firebase),
                    8.horizontalSpace,
                    const IconWidget(iconPath: IconManager.springBoot),
                    8.horizontalSpace,
                  ],),
                ),
                8.verticalSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}

