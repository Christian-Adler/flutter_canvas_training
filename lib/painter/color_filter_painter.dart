import 'package:flutter/material.dart';

class ColorFilterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // print(size);
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width * 1 / 4, 100), 50, paint);
    canvas.drawCircle(Offset(size.width * 3 / 4, 100), 50,
        paint..colorFilter = const ColorFilter.mode(Colors.purpleAccent, BlendMode.plus));
    canvas.drawCircle(Offset(size.width * 1 / 4, 300), 50,
        paint..colorFilter = const ColorFilter.mode(Colors.purpleAccent, BlendMode.darken));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
