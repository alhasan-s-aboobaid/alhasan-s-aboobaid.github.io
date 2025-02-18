import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/constants.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/icon_manager.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/core/widgets/animated_bubbles.dart';
import 'package:alhasan_abo_obaid/core/widgets/animated_text_count.dart';
import 'package:alhasan_abo_obaid/core/widgets/custom_button.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileSectionMobile extends StatelessWidget {
  final Sizes sizes;

  const ProfileSectionMobile({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: sizes.sectionPadding.all,
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: sizes.profileImageSize / 2,
                    foregroundImage: const AssetImage(IconManager.profileImage),
                    child: const AnimatedBubbles(
                      type: "",
                      size: "small",
                    ), // Replace with your image
                  ),
                )
              ],
            ),
            32.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AnimatedText(count: 8, label: "Years of\nExperience"),
                    8.horizontalSpace,
                    const AnimatedText(count: 15, label: "Projects\nCompleted"),
                    8.horizontalSpace,
                  ],
                ),
                24.verticalSpace,
                EntranceFader(
                  duration: Duration(milliseconds: 400),
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
                  duration: Duration(milliseconds: 1000),
                  child: Text(
                      "I help turn your vision into reality by designing and developing digital products that put the user at the heart of the experience. with more than 8 years of experience.",
                      style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                          fontSize: sizes.homeSubtitle,
                          color: Theme.of(context).themeColors.disabledButton)),
                ),
                32.verticalSpace,
                EntranceFader(
                  duration: Duration(milliseconds: 1400),
                  child: Row(
                    children: [
                      CustomButton(
                        title: "Download CV",
                        onPressed: () {
                          launchUrlString(Constants.cvUrl);
                        },
                      )
                    ],
                  ),
                ),
                48.verticalSpace,
                EntranceFader(
                  offset: Offset(100, 0),
                  child: Row(
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
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
