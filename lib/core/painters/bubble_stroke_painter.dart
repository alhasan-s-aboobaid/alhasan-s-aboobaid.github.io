import 'package:flutter/material.dart';

class BubblePainterStroke extends CustomPainter {
  final double scale;

  BubblePainterStroke(this.scale);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke;

    // Draw multiple bubbles
    final bubble1 = Offset(size.width * 0.2, size.height * 0.3);
    final bubble2 = Offset(size.width * 0.7, size.height * 0.5);
    final bubble22 = Offset(size.width * 0.9, size.height * 0.5);
    final bubble3 = Offset(size.width * 0.4, size.height * 0.7);
    final bubble4 = Offset(size.width * 0.4, size.height * 0.7);
    final bubble44 = Offset(size.width * 0.1, size.height * 0.7);

    canvas.drawCircle(bubble1, 50 * scale, paint);
    canvas.drawCircle(bubble2, 30 * scale, paint);
    canvas.drawCircle(bubble22, 10 * scale, paint);
    canvas.drawCircle(bubble3, 60 * scale, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}