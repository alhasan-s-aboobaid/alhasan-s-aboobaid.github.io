import 'dart:math';

import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/constants.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/icon_manager.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/core/widgets/custom_button.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:alhasan_abo_obaid/pages/profile/widgets/achievements_section.dart';
import 'package:alhasan_abo_obaid/pages/profile/widgets/animated_hero_section.dart';
import 'package:alhasan_abo_obaid/pages/profile/widgets/interactive_timeline.dart';
// Removed personal brand elements import
import 'package:alhasan_abo_obaid/pages/profile/widgets/skills_showcase.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EnhancedProfileSection extends StatelessWidget {
  final Sizes sizes;

  const EnhancedProfileSection({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = ScreenSizeUtil.getScreenType(context);

    // Define timeline events
    final List<TimelineEvent> timelineEvents = [
      TimelineEvent(
        title: "Senior Flutter Developer",
        organization: "ABC Tech Solutions",
        period: "2021 - Present",
        description: "Led the development of multiple mobile applications using Flutter, implementing complex features and ensuring high-quality code standards.",
        achievements: [
          "Led a team of 5 developers to deliver 3 major applications on time and within budget",
          "Implemented CI/CD pipelines that reduced deployment time by 40%",
          "Optimized app performance resulting in 30% faster load times",
          "Mentored junior developers and conducted code reviews"
        ],
        logoPath: IconManager.flutter,
        color: Colors.blue,
      ),
      TimelineEvent(
        title: "Flutter Developer",
        organization: "XYZ Mobile Apps",
        period: "2019 - 2021",
        description: "Developed and maintained Flutter applications, collaborated with design and backend teams, and implemented various third-party integrations.",
        achievements: [
          "Developed 8+ mobile applications for iOS and Android platforms",
          "Integrated complex APIs and third-party services",
          "Reduced app size by 25% through code optimization",
          "Implemented state management solutions using Provider and Bloc"
        ],
        logoPath: IconManager.dart,
        color: Colors.teal,
      ),
      TimelineEvent(
        title: "Mobile App Developer",
        organization: "Tech Innovators",
        period: "2017 - 2019",
        description: "Started as a native Android developer and transitioned to Flutter, gaining valuable experience in mobile app development principles and practices.",
        achievements: [
          "Transitioned from native Android to Flutter development",
          "Contributed to 5 successful app launches",
          "Implemented material design principles across all applications",
          "Collaborated with UX designers to improve user experience"
        ],
        logoPath: IconManager.android,
        color: Colors.green,
      ),
      TimelineEvent(
        title: "Bachelor of Science in Computer Science",
        organization: "University of Technology",
        period: "2013 - 2017",
        description: "Graduated with honors, focusing on software development and mobile applications.",
        achievements: [
          "Graduated with First Class Honors",
          "Specialized in Mobile Application Development",
          "Completed thesis on 'Optimizing Mobile UI Performance'",
          "Participated in multiple hackathons and coding competitions"
        ],
        logoPath: IconManager.flutter,
        color: Colors.purple,
      ),
    ];

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Animated Hero Section
            AnimatedHeroSection(
              sizes: sizes,
              screenType: screenType,
            ),

            // About Me Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenType == ScreenType.mobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EntranceFader(
                    duration: const Duration(milliseconds: 400),
                    child: Text(
                      "About Me",
                      style: Theme.of(context).styles.headingLarge.copyWith(
                        fontSize: screenType == ScreenType.mobile ? 28 : 36,
                        color: Theme.of(context).themeColors.primaryColor,
                      ),
                    ),
                  ),
                  16.vertical,
                  EntranceFader(
                    duration: const Duration(milliseconds: 600),
                    child: Text(
                      "I'm Alhasan Abo Obaid, a passionate Flutter developer with a strong foundation in mobile app development. I specialize in creating beautiful, responsive, and user-friendly applications that deliver exceptional user experiences.",
                      style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                        fontSize: screenType == ScreenType.mobile ? 14 : 16,
                        color: Theme.of(context).themeColors.disabledButton,
                        height: 1.6,
                      ),
                    ),
                  ),
                  16.vertical,
                  EntranceFader(
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      "With a keen eye for detail and a commitment to clean, efficient code, I strive to build applications that not only meet but exceed client expectations. My approach combines technical expertise with creative problem-solving to deliver solutions that are both innovative and practical.",
                      style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                        fontSize: screenType == ScreenType.mobile ? 14 : 16,
                        color: Theme.of(context).themeColors.disabledButton,
                        height: 1.6,
                      ),
                    ),
                  ),
                  16.vertical,
                  EntranceFader(
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      "I'm constantly learning and exploring new technologies to stay at the forefront of mobile development. My goal is to create applications that make a positive impact on users' lives while pushing the boundaries of what's possible with Flutter.",
                      style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                        fontSize: screenType == ScreenType.mobile ? 14 : 16,
                        color: Theme.of(context).themeColors.disabledButton,
                        height: 1.6,
                      ),
                    ),
                  ),
                  24.vertical,
                  EntranceFader(
                    duration: const Duration(milliseconds: 1200),
                    child: CustomButton(
                      title: "Download CV",
                      onPressed: () {
                        launchUrlString(Constants.cvUrl);
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Skills Showcase
            SkillsShowcase(
              screenType: screenType,
            ),

            // Interactive Timeline
            InteractiveTimeline(
              events: timelineEvents,
              screenType: screenType,
            ),

            // Achievements Section
            AchievementsSection(
              screenType: screenType,
            ),
          ],
        ),
      ),
    );
  }
}
