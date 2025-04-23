import 'dart:math';
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/theme_manager/text_theme/text_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/extensions.dart';
import 'package:alhasan_abo_obaid/core/utils/icon_manager.dart';
import 'package:alhasan_abo_obaid/core/utils/screen_size_util.dart';
import 'package:alhasan_abo_obaid/core/utils/sizes.dart';
import 'package:flutter/material.dart';

class AnimatedHeroSection extends StatefulWidget {
  final Sizes sizes;
  final ScreenType screenType;

  const AnimatedHeroSection({
    Key? key,
    required this.sizes,
    required this.screenType,
  }) : super(key: key);

  @override
  _AnimatedHeroSectionState createState() => _AnimatedHeroSectionState();
}

class _AnimatedHeroSectionState extends State<AnimatedHeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  // Removed particle animation for simplicity

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    // Removed particle initialization for simplicity
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = widget.screenType == ScreenType.mobile;

    return Container(
      height: isMobile ? 500 : 600,
      width: double.infinity,
      child: Stack(
        children: [

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Simplified avatar
                Container(
                  width: isMobile ? 180 : 220,
                  height: isMobile ? 180 : 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).themeColors.primaryColor.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      IconManager.profileImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Animated name
                ProgressiveTextAnimation(
                  text: "Alhasan Abo Obaid",
                  style: Theme.of(context).styles.headingLarge.copyWith(
                    fontSize: isMobile ? widget.sizes.homeTitle1 : widget.sizes.homeTitle1 * 1.2,
                    color: Colors.white,
                  ),
                  duration: const Duration(milliseconds: 1500),
                ),

                SizedBox(height: 16),

                // Animated title
                ProgressiveTextAnimation(
                  text: "Flutter Developer & Mobile Specialist",
                  style: Theme.of(context).styles.headingMedium.copyWith(
                    fontSize: widget.sizes.subtitleFontSize,
                    color: Theme.of(context).themeColors.primaryColor,
                  ),
                  duration: const Duration(milliseconds: 1500),
                  delay: const Duration(milliseconds: 1500),
                ),

                SizedBox(height: 30),

                // Floating tech icons
                FloatingTechIcons(
                  controller: _controller,
                  screenType: widget.screenType,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Progressive Text Animation
class ProgressiveTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;
  final Duration delay;

  const ProgressiveTextAnimation({
    Key? key,
    required this.text,
    required this.style,
    this.duration = const Duration(milliseconds: 1000),
    this.delay = Duration.zero,
  }) : super(key: key);

  @override
  _ProgressiveTextAnimationState createState() => _ProgressiveTextAnimationState();
}

class _ProgressiveTextAnimationState extends State<ProgressiveTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String _displayedText = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.text.length.toDouble(),
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          _displayedText = widget.text.substring(0, _animation.value.toInt());
        });
      });

    Future.delayed(widget.delay, () {
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
    return Text(
      _displayedText,
      style: widget.style,
      textAlign: TextAlign.center,
    );
  }
}

// Floating Tech Icons
class FloatingTechIcons extends StatelessWidget {
  final AnimationController controller;
  final ScreenType screenType;

  const FloatingTechIcons({
    Key? key,
    required this.controller,
    required this.screenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = screenType == ScreenType.mobile;
    final double iconSize = isMobile ? 30 : 40;

    final List<String> techIcons = [
      IconManager.flutter,
      IconManager.dart,
      IconManager.firebase,
      IconManager.figma,
      IconManager.springBoot,
    ];

    return Container(
      height: isMobile ? 80 : 100,
      width: isMobile ? 300 : 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: techIcons.map((icon) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(
              icon,
              width: iconSize,
              height: iconSize,
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Removed particle background for simplicity

// Removed avatar overlay painter for simplicity
