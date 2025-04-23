import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:flutter/material.dart';

class SkillChip extends StatefulWidget {
  final String name;
  final Color color;
  final IconData? icon;
  final bool isDark;

  const SkillChip({
    Key? key,
    required this.name,
    required this.color,
    this.icon,
    this.isDark = false,
  }) : super(key: key);

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = ScreenSizeUtil.getScreenType(context);
    final bool isMobile = screenType == ScreenType.mobile;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(
          right: isMobile ? 6 : 10,
          bottom: isMobile ? 6 : 10
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 16,
          vertical: isMobile ? 8 : 10
        ),
        decoration: BoxDecoration(
          color: isHovered
              ? widget.color.withOpacity(widget.isDark ? 0.8 : 0.2)
              : widget.isDark
                  ? Colors.black.withOpacity(0.3)
                  : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(isMobile ? 20 : 30),
          border: Border.all(
            color: widget.color.withOpacity(isHovered ? 0.8 : 0.3),
            width: 1,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.3),
                    blurRadius: isMobile ? 6 : 8,
                    spreadRadius: isMobile ? 0.5 : 1,
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              Icon(
                widget.icon,
                color: widget.isDark ? Colors.white : widget.color,
                size: isMobile ? 14 : 16,
              ),
              (isMobile ? 6 : 8).horizontal,
            ],
            Text(
              widget.name,
              style: TextStyle(
                color: widget.isDark ? Colors.white : widget.color,
                fontWeight: FontWeight.w500,
                fontSize: isMobile ? 12 : 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
