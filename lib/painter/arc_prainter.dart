import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // print(size);
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.amber
      ..style = PaintingStyle.stroke;

    final triangle = Path();
    triangle.moveTo(150, 0);
    triangle.relativeLineTo(100, 100);
    triangle.lineTo(size.width, 0);
    triangle.close();

    canvas.drawPath(triangle, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
