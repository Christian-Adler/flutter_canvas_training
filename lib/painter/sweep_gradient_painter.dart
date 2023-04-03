import 'dart:math' as math;

import 'package:flutter/material.dart';

class SweepGradientPainter extends CustomPainter {
  void paintSky(Canvas canvas, Rect rect) {
    const SweepGradient gradient = SweepGradient(
      center: Alignment(0.7, -0.6), // near the top right
      colors: <Color>[
        Color(0xFFFFFF00),
        Color(0xFF0099FF),
        Color(0xFFFFFF00),
      ],
      stops: <double>[0.25, 0.9, 1.0],
      transform: GradientRotation(math.pi), // 180° gedreht
    );
    // rect is the area we are painting over
    final Paint paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // print(size);
    final Rect rect = Rect.fromLTWH(10, 10, size.width - 20, size.height - 20);
    paintSky(canvas, rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
