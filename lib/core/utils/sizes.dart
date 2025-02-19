
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screen_size_util.dart';

class Sizes {
  final double appBarHeight;
  final double profileImageSize;
  final double titleFontSize;
  final double homeGreetingTitle;
  final double homeTitle1;
  final double homeSubtitle;
  final double subtitleFontSize;
  final double buttonFontSize;
  final double sectionPadding;
  final double animatedTextSize;
  final double animatedCountSize;
  final double animatedPlusSize;

  Sizes({
    required this.appBarHeight,
    required this.homeGreetingTitle,
    required this.profileImageSize,
    required this.titleFontSize,
    required this.subtitleFontSize,
    required this.buttonFontSize,
    required this.sectionPadding,
    required this.homeTitle1,
    required this.homeSubtitle,
    required this.animatedTextSize,
    required this.animatedCountSize,
    required this.animatedPlusSize,
  });

  factory Sizes.getSizes(ScreenType type) {
    switch (type) {
      case ScreenType.mobile:
        return Sizes(
          appBarHeight: 50,
          profileImageSize: 100,
          titleFontSize: 18,
          subtitleFontSize: 14,
          buttonFontSize: 12,
          sectionPadding: 20,
            homeGreetingTitle: 16,
          homeTitle1: 20,
          homeSubtitle: 12,
          animatedCountSize: 30,
          animatedPlusSize: 20,
          animatedTextSize: 10
        );
      case ScreenType.tablet:
        return Sizes(
          appBarHeight: 60,
            homeGreetingTitle: 20,
          profileImageSize: 150,
          titleFontSize: 22,
          subtitleFontSize: 16,
          buttonFontSize: 14,
          sectionPadding: 30,
            homeTitle1: 32,
          homeSubtitle: 20,
            animatedCountSize: 54,
            animatedPlusSize: 32,
            animatedTextSize: 18
        );
      case ScreenType.desktop:
        return Sizes(
          appBarHeight: 64,
            homeGreetingTitle: 24,
          profileImageSize: 200,
          titleFontSize: 28,
          subtitleFontSize: 18,
          buttonFontSize: 16,
          sectionPadding: 128.h,
            homeTitle1: 48,
          homeSubtitle: 18,
            animatedCountSize: 64,
            animatedPlusSize: 48,
            animatedTextSize: 16
        );
    }
  }
}