import 'package:flutter/material.dart';

class BlurPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // print(size);
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width * 1 / 4, 100), 50, paint..maskFilter = const MaskFilter.blur(BlurStyle.solid, 5));
    canvas.drawCircle(
        Offset(size.width * 3 / 4, 100), 50, paint..maskFilter = const MaskFilter.blur(BlurStyle.outer, 5));
    canvas.drawCircle(
        Offset(size.width * 1 / 4, 300), 50, paint..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5));
    canvas.drawCircle(
        Offset(size.width * 3 / 4, 300), 50, paint..maskFilter = const MaskFilter.blur(BlurStyle.inner, 5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
