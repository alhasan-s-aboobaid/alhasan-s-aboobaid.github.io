import 'dart:math' as math;
import 'package:flutter/material.dart';

class PolkaDotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.fill;

    final dotRadius = 10.0;
    final spacing = 40.0;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[850]!
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final sideLength = 30.0;
    final height = sideLength * math.sqrt(3);

    for (double x = 0; x < size.width; x += sideLength * 1.5) {
      for (double y = 0; y < size.height; y += height) {
        final offsetX = (y / height % 2 == 0) ? x : x + sideLength * 0.75;
        _drawHexagon(canvas, Offset(offsetX, y), sideLength, paint);
      }
    }
  }

  void _drawHexagon(Canvas canvas, Offset center, double sideLength, Paint paint) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = 2 * math.pi / 6 * i;
      final x = center.dx + sideLength * math.cos(angle);
      final y = center.dy + sideLength * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}