import 'package:flutter/material.dart';

class RadialGradientPainter extends CustomPainter {
  void paintSky(Canvas canvas, Rect rect) {
    const RadialGradient gradient = RadialGradient(
      center: Alignment(0.7, -0.6), // near the top right
      radius: 0.2,
      colors: <Color>[
        Color(0xFFFFFF00), // yellow sun
        Color(0xFF0099FF), // blue sky
      ],
      stops: <double>[0.4, 1.0],
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
