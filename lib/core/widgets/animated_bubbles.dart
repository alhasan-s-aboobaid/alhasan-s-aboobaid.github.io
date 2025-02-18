


import 'package:alhasan_abo_obaid/core/painters/bubble_painter.dart';
import 'package:alhasan_abo_obaid/core/painters/bubble_stroke_painter.dart';
import 'package:flutter/material.dart';

class AnimatedBubbles extends StatefulWidget {
  const AnimatedBubbles({super.key, required this.type, required this.size});

  final String type;
  final String size;

  @override
  _AnimatedBubblesState createState() => _AnimatedBubblesState();
}

class _AnimatedBubblesState extends State<AnimatedBubbles> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: widget.type != "stroke");

    _animation = Tween<double>(begin: 0.5, end: widget.size == "large" ? 2.5 : 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter:widget.type == "stroke" ? BubblePainterStroke(_animation.value) : BubblePainter(_animation.value),
          size: Size(12, 12),
        );
      },
    );
  }
}

