import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:flutter/material.dart';

class SkillHeader extends StatelessWidget {
  final Sizes sizes;

  const SkillHeader({
    Key? key,
    required this.sizes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = ScreenSizeUtil.getScreenType(context);
    final bool isMobile = screenType == ScreenType.mobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EntranceFader(
          duration: const Duration(milliseconds: 400),
          child: Text(
            "Professional Skills",
            style: Theme.of(context).styles.headingLarge.copyWith(
              fontSize: isMobile ? sizes.titleFontSize * 1.2 : sizes.titleFontSize * 1.5,
              color: Theme.of(context).themeColors.primaryColor,
            ),
          ),
        ),
        (isMobile ? 12 : 16).vertical,
        EntranceFader(
          duration: const Duration(milliseconds: 600),
          child: Text(
            "My technical expertise and professional capabilities",
            style: Theme.of(context).styles.bodyRegularMedium.copyWith(
              fontSize: isMobile ? sizes.subtitleFontSize * 0.9 : sizes.subtitleFontSize,
              color: Theme.of(context).themeColors.disabledButton,
            ),
          ),
        ),
        (isMobile ? 24 : 32).vertical,
        EntranceFader(
          duration: const Duration(milliseconds: 800),
          child: Container(
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
              border: Border.all(
                color: Theme.of(context).themeColors.primaryColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              "These are the principles I follow in every line of code I write. Every application I develop, every system I design, and every experience I create must not only function flawlessly but also be efficient and elegant.",
              style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                fontSize: isMobile ? sizes.subtitleFontSize * 0.85 : sizes.subtitleFontSize,
                color: Theme.of(context).themeColors.disabledButton,
                height: 1.6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
