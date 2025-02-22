
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoverTextAnimation extends StatefulWidget {
  const HoverTextAnimation({super.key, required this.text});

  final String text;

  @override
  _HoverTextAnimationState createState() => _HoverTextAnimationState();
}

class _HoverTextAnimationState extends State<HoverTextAnimation> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: TextStyle(
          fontSize: Sizes.getSizes(ScreenSizeUtil.getScreenType(context)).titleFontSize,
          fontWeight: FontWeight.bold,
          color: isHovered ? Theme.of(context).themeColors.primaryLight : Colors.white,
        ),
        child: Row(
          children: [
            Text(widget.text),
            8.horizontalSpace,
            Icon(Icons.arrow_circle_right_outlined, size: 32, color: isHovered ? Theme.of(context).themeColors.primaryLight : Colors.white,)
          ],
        ),
      ),
    );
  }
}
