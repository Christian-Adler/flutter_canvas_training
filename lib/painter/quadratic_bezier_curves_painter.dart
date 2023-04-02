import 'dart:math' as math;

import 'package:flutter/material.dart';

class QuadraticBezierCurvesPainter extends CustomPainter {
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

    final qCurve1 = Path()
      ..moveTo(50, 300)
      ..relativeQuadraticBezierTo(100, -100, 300, 0);
    canvas.drawPath(qCurve1, paint);

    final paint2 = Paint()
      ..strokeWidth = 2
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.stroke;

    final qCurve2 = Path()
      ..moveTo(350, 300)
      ..relativeQuadraticBezierTo(-100, 100, -300, 0);
    canvas.drawPath(qCurve2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
