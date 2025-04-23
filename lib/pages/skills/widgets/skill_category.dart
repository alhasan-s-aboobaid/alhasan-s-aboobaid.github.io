import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/pages/home/widgets/fader.dart';
import 'package:flutter/material.dart';

class SkillCategory extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final List<Widget> children;
  final int delayFactor;

  const SkillCategory({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.children,
    this.delayFactor = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = ScreenSizeUtil.getScreenType(context);
    final bool isMobile = screenType == ScreenType.mobile;

    return EntranceFader(
      delay: Duration(milliseconds: 300 * delayFactor),
      offset: const Offset(0, 30),
      child: Container(
        margin: EdgeInsets.only(bottom: isMobile ? 24 : 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isMobile ? 8 : 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).themeColors.primaryColor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
                  ),
                  child: Icon(
                    icon,
                    color: Theme.of(context).themeColors.primaryColor,
                    size: isMobile ? 20 : 24,
                  ),
                ),
                (isMobile ? 12 : 16).horizontal,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).styles.headingMedium.copyWith(
                        color: Colors.white,
                        fontSize: isMobile ? 18 : 20,
                      ),
                    ),
                    (isMobile ? 2 : 4).vertical,
                    Text(
                      description,
                      style: Theme.of(context).styles.bodyRegularSmall.copyWith(
                        color: Theme.of(context).themeColors.disabledButton,
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            (isMobile ? 12 : 16).vertical,
            ...children,
          ],
        ),
      ),
    );
  }
}
