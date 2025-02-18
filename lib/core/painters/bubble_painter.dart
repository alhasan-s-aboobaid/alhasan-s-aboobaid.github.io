
import 'package:flutter/material.dart';

class BubblePainter extends CustomPainter {
  final double scale;

  BubblePainter(this.scale);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF01BCB5).withOpacity(0.2)
      ..style = PaintingStyle.fill;

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
    canvas.drawCircle(bubble4, 20 * scale, paint);
    canvas.drawCircle(bubble44, 35 * scale, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}