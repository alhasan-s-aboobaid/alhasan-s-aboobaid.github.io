import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:flutter/material.dart';

class SkillProgressBar extends StatefulWidget {
  final String name;
  final double level;
  final Color color;
  final int index;

  const SkillProgressBar({
    Key? key,
    required this.name,
    required this.level,
    required this.color,
    required this.index,
  }) : super(key: key);

  @override
  State<SkillProgressBar> createState() => _SkillProgressBarState();
}

class _SkillProgressBarState extends State<SkillProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.level,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    // Delay the animation start based on the index
    Future.delayed(Duration(milliseconds: 300 * widget.index), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = ScreenSizeUtil.getScreenType(context);
    final bool isMobile = screenType == ScreenType.mobile;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(bottom: isMobile ? 16 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: Theme.of(context).styles.bodyRegularMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: isMobile ? 14 : 16,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 6 : 8,
                      vertical: isMobile ? 1 : 2
                    ),
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${(_animation.value * 100).toInt()}%',
                      style: TextStyle(
                        color: widget.color,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),
                  ),
                ],
              ),
              (isMobile ? 6 : 8).vertical,
              Stack(
                children: [
                  Container(
                    height: isMobile ? 6 : 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(isMobile ? 3 : 4),
                    ),
                  ),
                  Container(
                    height: isMobile ? 6 : 8,
                    // Adjust width multiplier based on screen size
                    width: MediaQuery.of(context).size.width * _animation.value *
                      (isMobile ? 0.65 : 0.4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          widget.color.withOpacity(0.7),
                          widget.color,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(isMobile ? 3 : 4),
                      boxShadow: [
                        BoxShadow(
                          color: widget.color.withOpacity(isMobile ? 0.3 : 0.5),
                          blurRadius: isMobile ? 4 : 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
