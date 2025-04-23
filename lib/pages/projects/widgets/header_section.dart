import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final Sizes sizes;

  const HeaderSection({
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
            "Featured Projects",
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
            "A selection of my recent work and contributions",
            style: Theme.of(context).styles.bodyRegularMedium.copyWith(
              fontSize: isMobile ? sizes.subtitleFontSize * 0.9 : sizes.subtitleFontSize,
              color: Theme.of(context).themeColors.disabledButton,
            ),
          ),
        ),
      ],
    );
  }
}
