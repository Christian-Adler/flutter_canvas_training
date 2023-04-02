import 'package:flutter/material.dart';

class BasicShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // print(size);
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.fill;

    final triangle = Path();
    triangle.moveTo(150, 0);
    triangle.relativeLineTo(100, 100);
    triangle.lineTo(size.width, 0);
    triangle.close();

    canvas.drawPath(triangle, paint);

    // Rechteck
    const square = Rect.fromLTWH(10, 10, 30, 20);
    canvas.drawRect(square, paint);

    // Kreis
    canvas.drawCircle(const Offset(60, 20), 10, paint);
    // OVal
    final oval = Rect.fromCenter(center: const Offset(90, 20), width: 30, height: 20);
    canvas.drawOval(oval, paint);

    // Stroke
    final paint2 = Paint()
      ..strokeWidth = 5
      ..color = Colors.lightGreenAccent
      ..style = PaintingStyle.stroke;

    final triangle2 = Path();
    triangle2.moveTo(0, size.height);
    triangle2.relativeLineTo(100, -100);
    triangle2.lineTo(size.width, size.height);
    triangle2.close();

    canvas.drawPath(triangle2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
