import 'dart:math' as math;

import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  double degreesToRadians(double deg) {
    return deg / 360 * 2 * math.pi;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // print(size);
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.amber
      ..style = PaintingStyle.stroke;

    const arcCenter = Offset(200, 80);
    final arcRect = Rect.fromCircle(center: arcCenter, radius: 75);
    final startAngle = degreesToRadians(10);
    final sweepAngle = degreesToRadians(90);
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, paint);
    canvas.drawArc(arcRect, degreesToRadians(110), degreesToRadians(45), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
