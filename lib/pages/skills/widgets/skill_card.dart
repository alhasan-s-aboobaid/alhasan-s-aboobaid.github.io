import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final int index;

  const SkillCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.index,
  }) : super(key: key);

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = ScreenSizeUtil.getScreenType(context);
    final bool isMobile = screenType == ScreenType.mobile;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuint,
        padding: EdgeInsets.all(isMobile ? 16 : 20),
        decoration: BoxDecoration(
          color: isHovered
              ? widget.color.withOpacity(0.15)
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
          border: Border.all(
            color: isHovered
                ? widget.color.withOpacity(0.5)
                : Colors.white.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.2),
                    blurRadius: isMobile ? 10 : 15,
                    spreadRadius: isMobile ? 1 : 2,
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isMobile ? 8 : 10),
                  decoration: BoxDecoration(
                    color: widget.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
                  ),
                  child: Icon(
                    widget.icon,
                    color: widget.color,
                    size: isMobile ? 20 : 24,
                  ),
                ),
                (isMobile ? 12 : 16).horizontal,
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).styles.headingSmall.copyWith(
                          color: Colors.white,
                          fontSize: isMobile ? 16 : 18,
                        ),
                  ),
                ),
              ],
            ),
            (isMobile ? 12 : 16).vertical,
            Text(
              widget.description,
              style: Theme.of(context).styles.bodyRegularSmall.copyWith(
                    color: Theme.of(context).themeColors.disabledButton,
                    height: 1.5,
                    fontSize: isMobile ? 12 : 14,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
