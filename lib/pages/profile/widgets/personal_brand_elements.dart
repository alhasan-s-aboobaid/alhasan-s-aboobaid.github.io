import 'dart:math';
import 'package:alhasan_abo_obaid/core/theme_manager/base_theme/base_theme_extension.dart';
import 'package:alhasan_abo_obaid/core/utils/icon_manager.dart';
import 'package:flutter/material.dart';

class PersonalBrandElements extends StatefulWidget {
  final Widget child;

  const PersonalBrandElements({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _PersonalBrandElementsState createState() => _PersonalBrandElementsState();
}

class _PersonalBrandElementsState extends State<PersonalBrandElements>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset _cursorPosition = Offset.zero;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Simplified implementation without custom cursor to fix rendering issues
    return Stack(
      children: [
        // Main content
        widget.child,

        // Animated logo in corner
        Positioned(
          right: 20,
          bottom: 20,
          child: AnimatedPersonalLogo(
            controller: _controller,
          ),
        ),
      ],
    );
  }
}

class AnimatedPersonalLogo extends StatelessWidget {
  final AnimationController controller;

  const AnimatedPersonalLogo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final double angle = controller.value * 2 * pi;

        return Transform.rotate(
          angle: angle * 0.2, // Subtle rotation
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).themeColors.primaryColor.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: EdgeInsets.all(12),
            child: Image.asset(
              IconManager.profileImage,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

class CustomCursor extends StatelessWidget {
  final Color color;

  const CustomCursor({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      child: Center(
        child: Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
