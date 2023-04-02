import 'dart:math' as math;

import 'package:flutter/material.dart';

class CubicBezierCurvesPainter extends CustomPainter {
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

    final cCurve1 = Path()
      ..moveTo(50, 150)
      ..relativeCubicTo(0, -100, 300, 100, 300, 0);
    canvas.drawPath(cCurve1, paint);
    final cCurve2 = Path()
      ..moveTo(50, 150)
      ..relativeCubicTo(0, 100, 300, -100, 300, 0);
    canvas.drawPath(cCurve2, paint..color = Colors.purple);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
